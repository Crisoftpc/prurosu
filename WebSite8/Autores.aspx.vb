Imports System.Data
Imports System.Data.SqlClient
Partial Class Autores
    Inherits System.Web.UI.Page
    Public cadena As New SqlConnection

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        cadena.ConnectionString = "Data Source=CGOMEZ-IT;Initial Catalog=dbzoom;Integrated Security=True"
    End Sub
    Protected Sub buscarcod(cod As String)
        cadena.Open()
        Dim sql As String
        sql = "select * from deptos where id ='" & cod & "'"
        'Dim cmd As New SqlCommand
        Dim cmd As New SqlCommand(sql, cadena)
        Dim odatareaderx As SqlDataReader
        odatareaderx = cmd.ExecuteReader()

        'GridView1.DataSource = odatareaderx
        txtbusqueda.Text = ""
        While odatareaderx.Read()

            TextBox1.Text = odatareaderx("id")
            TextBox2.Text = odatareaderx("nombre")
        End While

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            
            cadena.Open()
            Dim codigo, nombre, paisInfo, capital As String
            codigo = TextBox1.Text
            nombre = TextBox2.Text
            Dim sql As String
            sql = "insert into deptos (codigo,nombre) values ('" & codigo & "','" & nombre & "')"
            Dim cmd As New SqlCommand(sql, cadena)
            cmd.ExecuteNonQuery()
            cadena.Close()
            'lblmensaje.Text = "Guardado correctamente"
            TextBox1.Text = ""
            TextBox2.Text = ""

            Dim script As String = "<script type=text/javascript>alertas(1,'Guardado Correctamente');</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alertas", script, False)

        Catch ex As Exception
            Dim script As String = "<script type=text/javascript>alertas(0,'Error al guardar:' " & ex.Message & ");</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alertas", script, False)
        End Try
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            cadena.Open()
            Dim id As String
            id = txtbusqueda.Text
            'Dim odatareaderx As SqlDataReader
            Dim sql As String
            sql = "select * from deptos where nombre like  '%" & id & "%'"
            Dim cmd As New SqlCommand(sql, cadena)
            Dim adaptador As New SqlDataAdapter

            adaptador.SelectCommand = cmd
            'DataSet para almacenar Datos
            Dim DS As New DataSet
            'Rellenamos el DataTable del DataSet mediante el metodo Fill del DataAdapter
            adaptador.Fill(DS, "deptos")
            'Llenamos el control GridView con los datos que almacenamos en el DataSet
            GridView1.DataSource = DS
            GridView1.DataBind()


            'odatareaderx = cmd.ExecuteReader()
            'GridView1.DataSource = odatareaderx
            'txtbusqueda.Text = ""
            'While odatareaderx.Read()
            'TextBox1.Text = odatareaderx("codigo")
            'TextBox2.Text = odatareaderx("nombre")
            'End While
            'odatareaderx.Close()
            'txtbusqueda.Focus()
            'lblmensaje.Text = "Busqueda exitosa"
            Dim script As String = "<script type=text/javascript>alertas(1,'Consulta exitosa');</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alertas", script, False)
            Dim script2 As String = "<script type=text/javascript>abrirmodal();</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "abrirmodal", script2, False)

        Catch ex As Exception
            Dim script As String = "<script type=text/javascript>alertas(0,'error: ' " & ex.Message & ");</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alertas", script, False)
            ' lblmensaje.Text = "Error en la busqueda" & ex.Message
        End Try

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim script As String = "<script type=text/javascript>abrirmodal();</script>"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "abrirmodal", script, False)
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If (e.CommandName = "cmdseleccionar") Then
            Dim pos = Int(e.CommandArgument)
            Dim valor As String = Me.GridView1.Rows(pos).Cells(2).Text
            Me.buscarcod(valor)
            Dim script As String = "<script type=text/javascript>alertas(0,'dato: " & valor & "' );</script>"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "alertas", script, False)

        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub
    Protected Sub cmdseleccionar_Click(sender As Object, e As EventArgs)
        Dim script As String = "<script type=text/javascript>alertas(0,'error:' );</script>"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alertas", script, False)
    End Sub
End Class
