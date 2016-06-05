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


namespace visibilidad.Generar_Publicación
{
    public partial class GenerarPublicacion : Form
    {
        public int id_usuario;
        public GenerarPublicacion(int usuario_id)
        {
            id_usuario = usuario_id;
            InitializeComponent();
        }

        private void GenerarPublicacion_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.FormBorderStyle = FormBorderStyle.FixedDialog;
            Conexion con = new Conexion();                        
            string query_publicaciones = "SELECT p.codigo as Codigo, e.descripcion as Estado, t.descripcion as Tipo, p.descripcion as Descripcion " +
                    "FROM lpb.Publicaciones p, lpb.EstadosDePublicacion e, lpb.TiposDePublicacion t " +
                    "where p.EstadoDePublicacion_id=e.id and p.TipoDePublicacion_id=t.id and p.Usuario_id= " + id_usuario;            
            con.cnn.Open();
            DataTable dtDatos = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(query_publicaciones, con.cnn);
            da.Fill(dtDatos);            
            datagrid_listado.DataSource = dtDatos;
            con.cnn.Close();
            datagrid_listado.ReadOnly = true;            
            datagrid_listado.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;

            string query_usuario = "select u.username from lpb.usuarios u where u.id='" + id_usuario + "'";
            con = new Conexion();
            con.cnn.Open();
            SqlCommand command = new SqlCommand(query_usuario, con.cnn);
            SqlDataReader lector = command.ExecuteReader();
            lector.Read();
            string usuario = lector.GetString(0);
            con.cnn.Close();
            groupBox1.Text = "Listado de publicaciones del usuario " + usuario;
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Generar_Publicación.FormularioPublicacion formularioPublicacion = new Generar_Publicación.FormularioPublicacion(this,id_usuario,"A");
            formularioPublicacion.Show();
            this.Hide();
        }
        public void reset_publicaciones()
        {
            this.datagrid_listado.DataSource = null;
            this.datagrid_listado.Rows.Clear();
            Conexion con = new Conexion();                        
            string query_publicaciones = "SELECT p.codigo as Codigo, e.descripcion as Estado, t.descripcion as Tipo, p.descripcion as Descripcion " +
                    "FROM lpb.Publicaciones p, lpb.EstadosDePublicacion e, lpb.TiposDePublicacion t " +
                    "where p.EstadoDePublicacion_id=e.id and p.TipoDePublicacion_id=t.id and p.Usuario_id= " + id_usuario;
            con.cnn.Open();
            DataTable dtDatos = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(query_publicaciones, con.cnn);
            da.Fill(dtDatos);
            datagrid_listado.DataSource = dtDatos;
            con.cnn.Close();
            datagrid_listado.ReadOnly = true;
            datagrid_listado.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }
    }
}
