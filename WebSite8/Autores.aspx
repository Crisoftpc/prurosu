<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Autores.aspx.vb" Inherits="Autores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css"/>

<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/bootstrap.min.css"/>

<script language="JavaScript"type="text/javascript">
    function alertas(tipo, mensaje) {
        /*0: error, 1: notificacion simple*/
        if (tipo == 1) {
            alertify.success(mensaje);
        }
        if (tipo == 0) {
            alertify.error(mensaje);
        }
    }
    function abrirmodal() {
        $("#exampleModal").modal();
        console.log("abriendo cuadromodal");
    }
</script>
</head>
<body>
    <div class="container well" style="width=80%; margin:auto;">
        <br />
    
        <form id="form1" runat="server" class="col-12">
            <div class ="row">
                <div class="col-12">
                    <div class="input-group">
                        <asp:TextBox ID="txtbusqueda" runat="server" CssClass="form-control" placeholder="Ingrese parte del nombre" ></asp:TextBox>
                        <span class="input-group-btn">
                
                          <asp:Button ID="Button2" runat="server" Text="Buscar"  cssclass="btn btn-default"/>
                        </span>
                    </div>
                  </div>
            </div>
            <div>
                <br />
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableHeaderCell><label id="lblnombre">Código</label></asp:TableHeaderCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
          
                    <asp:TableRow>
                        <asp:TableHeaderCell><label id="lbltelefono">Nombre</label></asp:TableHeaderCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            <div>
                <hr />
                <asp:Button ID="Button1" runat="server" Text="Guardar" cssClass="btn btn-info"/>  <asp:Button ID="Button3" runat="server" Text="Eliminar" CssClass="btn btn-danger" />
                <hr />
            </div>
                   
            <!-- Modal -->
            <div class="modal fadeX" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">

                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CssClass="col-12">
                        <Columns>
                            <asp:BoundField DataField="codigo" HeaderText="codigo" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="id" HeaderText="ID" />
                            <asp:ButtonField Text="Seleccionar"  ControlStyle-CssClass="btn btn-info" CommandName="cmdseleccionar">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
       
              </div>
            </div>
          </div>
        </div>
  
        </form>
    </div>
    </body>
    
</html>
