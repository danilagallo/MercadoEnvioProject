﻿namespace visibilidad.ComprarOfertar
{
    partial class Ofertar_Box
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Ofertar_Box));
            this.label_indicacion1 = new System.Windows.Forms.Label();
            this.label_indicacion2 = new System.Windows.Forms.Label();
            this.label_anterior = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tbox_oferta = new System.Windows.Forms.TextBox();
            this.btn_ofertar = new System.Windows.Forms.Button();
            this.btn_cancelar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label_indicacion1
            // 
            this.label_indicacion1.AutoSize = true;
            this.label_indicacion1.Location = new System.Drawing.Point(8, 75);
            this.label_indicacion1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label_indicacion1.Name = "label_indicacion1";
            this.label_indicacion1.Size = new System.Drawing.Size(130, 13);
            this.label_indicacion1.TabIndex = 0;
            this.label_indicacion1.Text = "Ingrese el monto a ofertar:";
            // 
            // label_indicacion2
            // 
            this.label_indicacion2.AutoSize = true;
            this.label_indicacion2.Location = new System.Drawing.Point(10, 6);
            this.label_indicacion2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label_indicacion2.Name = "label_indicacion2";
            this.label_indicacion2.Size = new System.Drawing.Size(228, 26);
            this.label_indicacion2.TabIndex = 1;
            this.label_indicacion2.Text = "Recuerde que sólo puede ofertar una cantidad\r\nentera y superior a la oferta anter" +
    "ior\r\n";
            // 
            // label_anterior
            // 
            this.label_anterior.AutoSize = true;
            this.label_anterior.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label_anterior.Location = new System.Drawing.Point(8, 46);
            this.label_anterior.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label_anterior.Name = "label_anterior";
            this.label_anterior.Size = new System.Drawing.Size(104, 13);
            this.label_anterior.TabIndex = 2;
            this.label_anterior.Text = "Monto anterior: $";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(10, 100);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(28, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "AR$";
            // 
            // tbox_oferta
            // 
            this.tbox_oferta.Location = new System.Drawing.Point(40, 98);
            this.tbox_oferta.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.tbox_oferta.Name = "tbox_oferta";
            this.tbox_oferta.Size = new System.Drawing.Size(76, 20);
            this.tbox_oferta.TabIndex = 4;
            // 
            // btn_ofertar
            // 
            this.btn_ofertar.Location = new System.Drawing.Point(12, 137);
            this.btn_ofertar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_ofertar.Name = "btn_ofertar";
            this.btn_ofertar.Size = new System.Drawing.Size(104, 27);
            this.btn_ofertar.TabIndex = 5;
            this.btn_ofertar.Text = "Ofertar";
            this.btn_ofertar.UseVisualStyleBackColor = true;
            this.btn_ofertar.Click += new System.EventHandler(this.btn_ofertar_Click);
            // 
            // btn_cancelar
            // 
            this.btn_cancelar.Location = new System.Drawing.Point(128, 137);
            this.btn_cancelar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btn_cancelar.Name = "btn_cancelar";
            this.btn_cancelar.Size = new System.Drawing.Size(104, 27);
            this.btn_cancelar.TabIndex = 6;
            this.btn_cancelar.Text = "Cancelar";
            this.btn_cancelar.UseVisualStyleBackColor = true;
            this.btn_cancelar.Click += new System.EventHandler(this.btn_cancelar_Click);
            // 
            // Ofertar_Box
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(244, 177);
            this.Controls.Add(this.btn_cancelar);
            this.Controls.Add(this.btn_ofertar);
            this.Controls.Add(this.tbox_oferta);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label_anterior);
            this.Controls.Add(this.label_indicacion2);
            this.Controls.Add(this.label_indicacion1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Ofertar_Box";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Ofertar";
            this.Load += new System.EventHandler(this.Ofertar_Box_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label_indicacion1;
        private System.Windows.Forms.Label label_indicacion2;
        private System.Windows.Forms.Label label_anterior;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbox_oferta;
        private System.Windows.Forms.Button btn_ofertar;
        private System.Windows.Forms.Button btn_cancelar;
    }
}