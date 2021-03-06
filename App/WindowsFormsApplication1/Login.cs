﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Security.Cryptography;
using Helper;
using conectar;
using readConfiguracion;

namespace visibilidad
{
    public partial class Login : Form
    {

        public int id_usuario;
        public int intFallidos;
        public bool userHabilitado;
        public string pass = "";
        public string rol = "";
        public Login()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.FormBorderStyle = FormBorderStyle.FixedDialog;
            
            //Disparar actualizaciones de vencimientos
            DateTime fecha_actual = DateTime.ParseExact(readConfiguracion.Configuracion.fechaSystem(), "yyyy-dd-MM", System.Globalization.CultureInfo.InvariantCulture);

            Conexion cn = new Conexion();
            cn.cnn.Open();
            bool resultado = cn.executeProcedure(cn.getSchema() + @".SP_Actualizar_Vencimientos", Helper.Help.generarListaParaProcedure("@fecha_actual"), fecha_actual);
            //if (resultado)
            //    MessageBox.Show("Fechas actualizadas", "Mensaje...", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //else
            //    MessageBox.Show("Las fechas no se pudieron actualizar", "Mensaje...", MessageBoxButtons.OK, MessageBoxIcon.Error);
            cn.cnn.Close();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_ingresar_Click(object sender, EventArgs e)
        {
            if (text_usuario.Text == "")
            {
                MessageBox.Show("El campo usuario no puede estar vacio", "Inicio de sesion erroneo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (text_password.Text == "")
            {
                MessageBox.Show("El campo password no puede estar vacio", "Inicio de sesion erroneo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            Conexion con = new Conexion();
            string query = "SELECT pass, cantIntentosFallidos, habilitado, id " +
                           "FROM lpb.Usuarios WHERE userName = '" + text_usuario.Text + "'";

            con.cnn.Open();
            SqlCommand command = new SqlCommand(query, con.cnn);
            SqlDataReader lector = command.ExecuteReader();

            if (!lector.Read())
            {
                con.cnn.Close();
                MessageBox.Show("Usuario Inválido", "Inicio de sesion erroneo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                text_usuario.Text = "";
                text_password.Text = "";
                text_usuario.Focus();
                return;
            }

            pass = lector.GetString(0);
            intFallidos = lector.GetInt32(1);
            userHabilitado = lector.GetBoolean(2);
            id_usuario = lector.GetInt32(3);
            con.cnn.Close();

            ///////////////////////////////////////////////////////////////////////////
            if (userHabilitado == false)
            {
                MessageBox.Show("Su cuenta de usuario esta inhabilitada", "Inicio de sesion erroneo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!(pass == text_password.Text.Sha256()))
            {
                intFallidos++;
                if (intFallidos == 3)
                {
                    string query2;
                    query2 = "UPDATE lpb.Usuarios SET habilitado = 0 WHERE username = '" + text_usuario.Text + "'";
                    MessageBox.Show("Su cuenta a sido inhabilitada por demasiados intentos de inicio de sesion", "Inicio de sesion erroneo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    con.cnn.Open();
                    SqlCommand command1 = new SqlCommand(query2, con.cnn);
                    command1.ExecuteNonQuery();
                    string query3;
                    query3 = "UPDATE lpb.usuarios SET cantIntentosFallidos = " + intFallidos + " WHERE username = '" + text_usuario.Text + "'";
                    SqlCommand command2 = new SqlCommand(query3, con.cnn);
                    command2.ExecuteNonQuery();
                    con.cnn.Close();

                }
                else
                {
                    string query2;
                    query2 = "UPDATE lpb.usuarios SET cantIntentosFallidos = " + intFallidos + " WHERE userName = '" + text_usuario.Text + "'";
                    con.cnn.Open();
                    SqlCommand command1 = new SqlCommand(query2, con.cnn);
                    command1.ExecuteNonQuery();
                    con.cnn.Close();
                    MessageBox.Show("Contraseña Inválida", "Inicio de sesion erroneo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                text_password.Text = "";
                text_password.Focus();

                return;
            }
            else
            {
                /*LIMPIA LOS INTENTOS FALLIDOS*/

                string query3 = "UPDATE lpb.usuarios SET cantIntentosFallidos = 0 " +
                                "WHERE username = '" + text_usuario.Text + "'";
                con.cnn.Open();
                SqlCommand command2 = new SqlCommand(query3, con.cnn);
                command2.ExecuteNonQuery();
                con.cnn.Close();
            }

            text_usuario.Focus();

            grp_login.Visible = false;
            grp_rol.Visible = true;

            /*CARGA LOS ROLES DEL USUARIO EN EL COMBOBOX*/
            cmb_roles.Items.Clear();
            query = "select r.nombre from lpb.Usuarios u, lpb.RolesPorUsuario rxu, lpb.Roles r " +
                    "where u.id = rxu.Usuario_id and rxu.Rol_id=r.id and u.username= " + "'" + text_usuario.Text + "'";
            con.cnn.Open();
            command = new SqlCommand(query, con.cnn);
            lector = command.ExecuteReader();
            int cont = 0;
            while (lector.Read())
            {
                cmb_roles.Items.Add(lector.GetString(0));
                cont++;
            }
            con.cnn.Close();
            text_usuario.Text = "";
            text_password.Text = "";
            
            if (cont == 0)
            {
                Menu mp = new Menu();
                this.Hide();
                mp.Show();
                mp.cargarRoles(id_usuario, "sin roles", this);
                grp_rol.Visible = false;
                grp_login.Visible = true;
                cmb_roles.SelectedIndex = -1;

            }
            else if (cont == 1)
            {
                cmb_roles.SelectedIndex = 0;
                Menu mp = new Menu();
                this.Hide();
                mp.Show();
                mp.cargarRoles(id_usuario, cmb_roles.Text, this);
                grp_rol.Visible = false;
                grp_login.Visible = true;
                cmb_roles.SelectedIndex = -1;

            }
            //cmb_roles.SelectedIndex = 0;
        }

        private void text_password_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
            {
                btn_ingresar.PerformClick();
            }
        }

        private void btn_volver_Click(object sender, EventArgs e)
        {
            grp_rol.Visible = false;
            grp_login.Visible = true;

        }

        private void btn_aceptar_Click(object sender, EventArgs e)
        {
            if (cmb_roles.Text == "")
                MessageBox.Show("Debe seleccionar un Rol", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                Menu mp = new Menu();
                this.Hide();
                mp.Show();
                mp.cargarRoles(id_usuario, cmb_roles.Text, this);
                grp_rol.Visible = false;
                grp_login.Visible = true;
                cmb_roles.SelectedIndex = -1;
            }
        }

    }
}
