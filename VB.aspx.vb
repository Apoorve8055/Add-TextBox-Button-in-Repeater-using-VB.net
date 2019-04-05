
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class VB
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindRepeater()
        End If
    End Sub

    Private Sub BindRepeater()
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)
            Using cmd As SqlCommand = New SqlCommand("SELECT * FROM login", con)
                Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
                    Dim dt As DataTable = New DataTable()
                    sda.Fill(dt)
                    rptCustomers.DataSource = dt
                    rptCustomers.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub GetValue(ByVal sender As Object, ByVal e As EventArgs)

        Dim item As RepeaterItem = TryCast((TryCast(sender, Button)).NamingContainer, RepeaterItem)
        Dim user As String = (TryCast(item.FindControl("lblCustomerId"), TextBox)).Text
        Dim pass As String = (TryCast(item.FindControl("txtCountry"), TextBox)).Text
        Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Dim con As SqlConnection = New SqlConnection(constr)
        Dim sql As String = "INSERT INTO login VALUES('" & user & "','" & pass & "')"
        Using Command As SqlCommand = New SqlCommand(sql, con)
            con.Open()
            Command.ExecuteReader()
            Response.Write("<script>alert('Add user Succesfully')</script>")
        End Using
        BindRepeater()
    End Sub


End Class
