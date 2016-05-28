﻿namespace visibilidad.ComprarOfertar
{
    partial class BusquedaPublicacion
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
            this.group_buscar = new System.Windows.Forms.GroupBox();
            this.btn_limpiar = new System.Windows.Forms.Button();
            this.label_rubro = new System.Windows.Forms.Label();
            this.tbox_descr = new System.Windows.Forms.TextBox();
            this.checklist_rubros = new System.Windows.Forms.CheckedListBox();
            this.label_palabrasclave = new System.Windows.Forms.Label();
            this.btn_volver = new System.Windows.Forms.Button();
            this.btn_buscar = new System.Windows.Forms.Button();
            this.grid_publis = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Descripción = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Stock = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fecha = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btn_pregunta = new System.Windows.Forms.Button();
            this.btn_comprar = new System.Windows.Forms.Button();
            this.group_buscar.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grid_publis)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // group_buscar
            // 
            this.group_buscar.BackColor = System.Drawing.Color.Transparent;
            this.group_buscar.Controls.Add(this.btn_limpiar);
            this.group_buscar.Controls.Add(this.label_rubro);
            this.group_buscar.Controls.Add(this.tbox_descr);
            this.group_buscar.Controls.Add(this.checklist_rubros);
            this.group_buscar.Controls.Add(this.label_palabrasclave);
            this.group_buscar.Controls.Add(this.btn_volver);
            this.group_buscar.Controls.Add(this.btn_buscar);
            this.group_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.group_buscar.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.group_buscar.Location = new System.Drawing.Point(12, 11);
            this.group_buscar.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.group_buscar.Name = "group_buscar";
            this.group_buscar.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.group_buscar.Size = new System.Drawing.Size(880, 203);
            this.group_buscar.TabIndex = 4;
            this.group_buscar.TabStop = false;
            this.group_buscar.Text = "Búsqueda de Publicaciones";
            // 
            // btn_limpiar
            // 
            this.btn_limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_limpiar.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_limpiar.Location = new System.Drawing.Point(714, 96);
            this.btn_limpiar.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btn_limpiar.Name = "btn_limpiar";
            this.btn_limpiar.Size = new System.Drawing.Size(150, 30);
            this.btn_limpiar.TabIndex = 8;
            this.btn_limpiar.Text = "Limpiar";
            this.btn_limpiar.UseVisualStyleBackColor = true;
            this.btn_limpiar.Click += new System.EventHandler(this.btn_limpiar_Click);
            // 
            // label_rubro
            // 
            this.label_rubro.AutoSize = true;
            this.label_rubro.Location = new System.Drawing.Point(18, 73);
            this.label_rubro.Name = "label_rubro";
            this.label_rubro.Size = new System.Drawing.Size(63, 20);
            this.label_rubro.TabIndex = 7;
            this.label_rubro.Text = "Rubros";
            // 
            // tbox_descr
            // 
            this.tbox_descr.Location = new System.Drawing.Point(158, 36);
            this.tbox_descr.Name = "tbox_descr";
            this.tbox_descr.Size = new System.Drawing.Size(541, 27);
            this.tbox_descr.TabIndex = 6;
            this.tbox_descr.TextChanged += new System.EventHandler(this.tbox_descr_TextChanged);
            // 
            // checklist_rubros
            // 
            this.checklist_rubros.CheckOnClick = true;
            this.checklist_rubros.FormattingEnabled = true;
            this.checklist_rubros.Location = new System.Drawing.Point(158, 73);
            this.checklist_rubros.Name = "checklist_rubros";
            this.checklist_rubros.Size = new System.Drawing.Size(541, 114);
            this.checklist_rubros.TabIndex = 5;
            this.checklist_rubros.SelectedIndexChanged += new System.EventHandler(this.checklist_rubros_SelectedIndexChanged);
            // 
            // label_palabrasclave
            // 
            this.label_palabrasclave.AutoSize = true;
            this.label_palabrasclave.Location = new System.Drawing.Point(18, 36);
            this.label_palabrasclave.Name = "label_palabrasclave";
            this.label_palabrasclave.Size = new System.Drawing.Size(99, 20);
            this.label_palabrasclave.TabIndex = 4;
            this.label_palabrasclave.Text = "Descripción";
            // 
            // btn_volver
            // 
            this.btn_volver.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_volver.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_volver.Location = new System.Drawing.Point(714, 157);
            this.btn_volver.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btn_volver.Name = "btn_volver";
            this.btn_volver.Size = new System.Drawing.Size(150, 30);
            this.btn_volver.TabIndex = 2;
            this.btn_volver.Text = "Volver";
            this.btn_volver.UseVisualStyleBackColor = true;
            this.btn_volver.Click += new System.EventHandler(this.btn_volver_Click);
            // 
            // btn_buscar
            // 
            this.btn_buscar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_buscar.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_buscar.Location = new System.Drawing.Point(714, 39);
            this.btn_buscar.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btn_buscar.Name = "btn_buscar";
            this.btn_buscar.Size = new System.Drawing.Size(150, 30);
            this.btn_buscar.TabIndex = 1;
            this.btn_buscar.Text = "Buscar";
            this.btn_buscar.UseVisualStyleBackColor = true;
            // 
            // grid_publis
            // 
            this.grid_publis.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grid_publis.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.Descripción,
            this.Precio,
            this.Stock,
            this.fecha});
            this.grid_publis.Location = new System.Drawing.Point(11, 34);
            this.grid_publis.Name = "grid_publis";
            this.grid_publis.RowTemplate.Height = 24;
            this.grid_publis.Size = new System.Drawing.Size(688, 328);
            this.grid_publis.TabIndex = 5;
            // 
            // ID
            // 
            this.ID.HeaderText = "Código";
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 65;
            // 
            // Descripción
            // 
            this.Descripción.HeaderText = "Descripción";
            this.Descripción.Name = "Descripción";
            this.Descripción.ReadOnly = true;
            this.Descripción.Width = 250;
            // 
            // Precio
            // 
            this.Precio.HeaderText = "Precio";
            this.Precio.Name = "Precio";
            this.Precio.ReadOnly = true;
            // 
            // Stock
            // 
            this.Stock.HeaderText = "Stock";
            this.Stock.Name = "Stock";
            this.Stock.ReadOnly = true;
            this.Stock.Width = 50;
            // 
            // fecha
            // 
            this.fecha.HeaderText = "Fecha de Vencimiento";
            this.fecha.Name = "fecha";
            this.fecha.ReadOnly = true;
            this.fecha.Width = 180;
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.btn_pregunta);
            this.groupBox1.Controls.Add(this.btn_comprar);
            this.groupBox1.Controls.Add(this.grid_publis);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.groupBox1.Location = new System.Drawing.Point(12, 229);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Size = new System.Drawing.Size(880, 379);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Búsqueda de Publicaciones";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // btn_pregunta
            // 
            this.btn_pregunta.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_pregunta.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_pregunta.Location = new System.Drawing.Point(714, 94);
            this.btn_pregunta.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btn_pregunta.Name = "btn_pregunta";
            this.btn_pregunta.Size = new System.Drawing.Size(150, 30);
            this.btn_pregunta.TabIndex = 9;
            this.btn_pregunta.Text = "Realizar Pregunta";
            this.btn_pregunta.UseVisualStyleBackColor = true;
            // 
            // btn_comprar
            // 
            this.btn_comprar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_comprar.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_comprar.Location = new System.Drawing.Point(714, 35);
            this.btn_comprar.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btn_comprar.Name = "btn_comprar";
            this.btn_comprar.Size = new System.Drawing.Size(150, 30);
            this.btn_comprar.TabIndex = 8;
            this.btn_comprar.Text = "Comprar";
            this.btn_comprar.UseVisualStyleBackColor = true;
            // 
            // BusquedaPublicacion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(906, 620);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.group_buscar);
            this.Name = "BusquedaPublicacion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Búsqueda de Publicaciones";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.group_buscar.ResumeLayout(false);
            this.group_buscar.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.grid_publis)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        public System.Windows.Forms.GroupBox group_buscar;
        private System.Windows.Forms.Label label_rubro;
        private System.Windows.Forms.TextBox tbox_descr;
        private System.Windows.Forms.CheckedListBox checklist_rubros;
        private System.Windows.Forms.Label label_palabrasclave;
        private System.Windows.Forms.Button btn_volver;
        private System.Windows.Forms.Button btn_buscar;
        private System.Windows.Forms.DataGridView grid_publis;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Descripción;
        private System.Windows.Forms.DataGridViewTextBoxColumn Precio;
        private System.Windows.Forms.DataGridViewTextBoxColumn Stock;
        private System.Windows.Forms.DataGridViewTextBoxColumn fecha;
        public System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btn_pregunta;
        private System.Windows.Forms.Button btn_comprar;
        private System.Windows.Forms.Button btn_limpiar;
    }
}