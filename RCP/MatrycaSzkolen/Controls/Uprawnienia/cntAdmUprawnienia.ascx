﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cntAdmUprawnienia.ascx.cs" Inherits="HRRcp.MatrycaSzkolen.Controls.Uprawnienia.cntAdmUprawnienia" %>

<%@ Register Src="~/MatrycaSzkolen/Controls/Uprawnienia/cntAdmPola.ascx" TagPrefix="cc" TagName="Pola" %>
<%@ Register Src="~/MatrycaSzkolen/Controls/Uprawnienia/cntTransfer.ascx" TagPrefix="cc" TagName="Transfer" %>


<div id="paAdmUprawnienia" runat="server" class="cntAdmUprawnienia">
    <div class="title">
        <asp:Label ID="Label1" runat="server" Text="Typy uprawnień"></asp:Label>
    </div>

    <asp:ListView ID="lvTypy" runat="server" DataKeyNames="Id" 
        DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" >
        <ItemTemplate>
            <tr class="it">
                <td class="control1">
                    <%--<asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Zaznacz" />--%>
                    <%--<asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-ok checker"></i></asp:LinkButton>--%>

                      <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-unchecked checker"></i></asp:LinkButton>

                </td>
                <td class="num">
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TypNazwaLabel" runat="server" Text='<%# Eval("TypNazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="TypNazwaENLabel" runat="server" Text='<%# Eval("TypNazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnyCheckBox" runat="server" Checked='<%# Eval("Aktywny") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="WyborCheckBox" runat="server" Checked='<%# Eval("Wybor") %>' Enabled="false" />
                </td>
                <td class="control">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="false" CssClass="btn btn-sm btn-default" />
                    <%--<asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-default" />--%>
                      <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <SelectedItemTemplate>
            <tr class="sit">
                <td class="control1">
                    <%--<asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Enabled="false"><i class="glyphicon glyphicon-ok checker checked"></i></asp:LinkButton>--%>
                      <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-check checker checked"></i></asp:LinkButton>

                </td>
                <td class="num">
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="TypNazwaLabel" runat="server" Text='<%# Eval("TypNazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="TypNazwaENLabel" runat="server" Text='<%# Eval("TypNazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnyCheckBox" runat="server" Checked='<%# Eval("Aktywny") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="WyborCheckBox" runat="server" Checked='<%# Eval("Wybor") %>' Enabled="false" />
                </td>
                <td class="control">
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="false"  CssClass="btn btn-sm btn-default" />
                    <%--<asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit"  CssClass="btn btn-sm btn-default" />--%>
                      <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
                </td>
            </tr>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        Brak danych
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="iit">
                <td class="control1">
                </td>
                <td class="num">
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' CssClass="" />
                </td>
                <td>
                    <asp:TextBox ID="TypNazwaTextBox" runat="server" Text='<%# Bind("TypNazwa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TypNazwaENTextBox" runat="server" Text='<%# Bind("TypNazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnyCheckBox" runat="server" Checked='<%# Bind("Aktywny") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="WyborCheckBox" runat="server" Checked='<%# Bind("Wybor") %>' />
                </td>
                <td class="control">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-sm btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="" />
                </td>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            <tr class="eit">
                <td class="control1">
                </td>
                <td class="num">
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' Enabled='<%# IsSuperUser %>'  />
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Id2") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TypNazwaTextBox" runat="server" Text='<%# Bind("TypNazwa") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TypNazwaENTextBox" runat="server" Text='<%# Bind("TypNazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnyCheckBox" runat="server" Checked='<%# Bind("Aktywny") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="WyborCheckBox" runat="server" Checked='<%# Bind("Wybor") %>' />
                </td>
                <td class="control">
                    <%--                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-sm btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-sm btn-default" />--%>

                    <asp:LinkButton ID="SaveButton" runat="server" CommandName="Update" CssClass="btn xbtn-sm xbtn-default text-success"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-ban-circle"></i></asp:LinkButton>

                </td>
            </tr>
        </EditItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                            <tr runat="server" style="">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    Typ</th>
                                <th runat="server">
                                    Nazwa</th>
                                <th runat="server">
                                    Nazwa EN</th>
                                <th runat="server">
                                    Kolejność</th>
                                <th runat="server">
                                    Aktywny</th>
                                <th runat="server">
                                    Wybór</th>
                                <th id="Th1" runat="server">
                                </th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
        DeleteCommand="DELETE FROM [UprawnieniaTypy] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [UprawnieniaTypy] ([Id], [TypNazwa], [Kolejnosc], [Aktywny], [Wybor], [TypNazwaEN]) VALUES (@Id, @TypNazwa, @Kolejnosc, @Aktywny, @Wybor, @TypNazwaEN)" 
        SelectCommand="SELECT *, Id as Id2 FROM [UprawnieniaTypy] ORDER BY [Kolejnosc]" 
        UpdateCommand="UPDATE [UprawnieniaTypy] SET Id = @Id, [TypNazwa] = @TypNazwa, [Kolejnosc] = @Kolejnosc, [Aktywny] = @Aktywny, [Wybor] = @Wybor, [TypNazwaEN] = @TypNazwaEN WHERE [Id] = @Id2">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TypNazwa" Type="String" />
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywny" Type="Boolean" />
            <asp:Parameter Name="Wybor" Type="Boolean" />
            <asp:Parameter Name="TypNazwaEN" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Id2" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="TypNazwa" Type="String" />
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywny" Type="Boolean" />
            <asp:Parameter Name="Wybor" Type="Boolean" />
            <asp:Parameter Name="TypNazwaEN" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>





    <div class="title">
<%--
        <asp:Label ID="Label2" runat="server" Text="Kwalifikacje"></asp:Label>
--%>
        <asp:Label ID="Label5" runat="server" Text="Klasyfikacje"></asp:Label>
    </div>

    <asp:ListView ID="lvKwalifikacje" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource2" InsertItemPosition='<%# GetInsertItemPositionKwal() %>' >
        <ItemTemplate>
            <tr class="it">
                <td class="control1">
                    <%--<asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Zaznacz" />--%>
                    <%--<asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-ok checker"></i></asp:LinkButton>--%>

                      <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-unchecked checker"></i></asp:LinkButton>
                </td>
                <td class="num">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="TypLabel" runat="server" Text='<%# Eval("Typ") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaENLabel" runat="server" Text='<%# Eval("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Eval("Aktywna") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Eval("Szkolenie") %>' Enabled="false" />
                </td>
                <td class="control">
<%--                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="true" CssClass="btn btn-sm btn-default" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-default" />--%>
                      <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
  <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn xbtn-sm xbtn-default text-danger"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>

                </td>
            </tr>
        </ItemTemplate>
        <SelectedItemTemplate>
            <tr class="sit">
                <td class="control1">
                    <%--<asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-ok checker checked"></i></asp:LinkButton>--%>
                      <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-check checker checked"></i></asp:LinkButton>


                </td>
                <td class="num">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="TypLabel" runat="server" Text='<%# Eval("Typ") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaENLabel" runat="server" Text='<%# Eval("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Eval("Aktywna") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Eval("Szkolenie") %>' Enabled="false" />
                </td>
                <td class="control">
              <%--      <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="false" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-default" />--%>
  <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
  <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn xbtn-sm xbtn-default text-danger"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>
                </td>
            </tr>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" class="tbKwalifikacje_edt">
                <tr>
                    <td>
                        Proszę zaznaczyć typ uprawnienia...
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="iit">
                <td class="control1">
                </td>
                <td>
                </td>
                <td class="num">
                    <asp:TextBox ID="TypTextBox" runat="server" Text='<%# Bind("Typ") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaENTextBox" runat="server" Text='<%# Bind("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Bind("Aktywna") %>'/>
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Szkolenie") %>' Enabled="true" />
                </td>
                <td class="control">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-sm btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-sm btn-default"  />
                </td>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            <tr class="eit">
                <td class="control1">
                </td>
                <td class="num">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="TypTextBox" runat="server" Text='<%# Bind("Typ") %>' Enabled='<%# IsSuperUser %>'  />
                </td>
                <td>
                    <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaENTextBox" runat="server" Text='<%# Bind("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Bind("Aktywna") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# Bind("Szkolenie") %>' Enabled="true" />
                </td>
                <td class="control">
                  <%--  <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-sm btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-sm btn-default" />--%>
                     <asp:LinkButton ID="SaveButton" runat="server" CommandName="Update" CssClass="btn xbtn-sm xbtn-default text-success"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
  <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-ban-circle"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="" class="table" >
                            <tr runat="server" style="">
                                <th runat="server">
                                </th>
                                <th id="Th10" runat="server">
                                    Id</th>
                                <th id="Th11" runat="server">
                                    Typ</th>
                                <th runat="server">
                                    Nazwa</th>
                                <th id="Th3" runat="server">
                                    Nazwa EN</th>
                                <th runat="server">
                                    Kolejność</th>
                                <th id="Th4" runat="server">
                                    Aktywna</th>
                                <th id="Th9" runat="server">
                                    Szkolenie</th>
                                <th id="Th5" runat="server" class="control"> 
                                    </th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    
<%--                        <asp:DataPager ID="DataPager1" runat="server" >
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
--%>                        
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
        DeleteCommand="DELETE FROM [UprawnieniaKwalifikacje] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [UprawnieniaKwalifikacje] ([Typ], [Nazwa], [Kolejnosc], [Aktywna], [NazwaEN], Szkolenie) VALUES (@Typ, @Nazwa, @Kolejnosc, @Aktywna, @NazwaEN, @Szkolenie)" 
        SelectCommand="SELECT * FROM [UprawnieniaKwalifikacje] WHERE ([Typ] = @Typ) ORDER BY [Kolejnosc]" 
        UpdateCommand="UPDATE [UprawnieniaKwalifikacje] SET [Typ] = @Typ, [Nazwa] = @Nazwa, [Kolejnosc] = @Kolejnosc, [Aktywna] = @Aktywna, [NazwaEN] = @NazwaEN, Szkolenie = @Szkolenie WHERE [Id] = @Id">
        <SelectParameters>
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywna" Type="Boolean" />
            <asp:Parameter Name="NazwaEN" Type="String" />
            <asp:Parameter Name="Szkolenie" Type="Boolean" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywna" Type="Boolean" />
            <asp:Parameter Name="NazwaEN" Type="String" />
            <asp:Parameter Name="Szkolenie" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>



    <div class="title">
        <%--
        <asp:Label ID="Label2" runat="server" Text="Kwalifikacje"></asp:Label>
        --%>
        <asp:Label ID="Label2" runat="server" Text="Grupy"></asp:Label>
    </div>
    <asp:ListView ID="lvGrupy" runat="server" DataKeyNames="Id"
        DataSourceID="dsGrupy" InsertItemPosition='<%# GetInsertItemPositionGrupy() %>'>
        <ItemTemplate>
            <tr class="it">
                <td class="control1">
                    <%--<asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Zaznacz" />--%>
                    <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-unchecked checker"></i></asp:LinkButton>
                </td>
                <td class="num">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="TypLabel" runat="server" Text='<%# Eval("Typ") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaENLabel" runat="server" Text='<%# Eval("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Eval("Aktywna") %>' Enabled="false" />
                </td>
                <td class="control">
                    <%--                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="false"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-default" />--%>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn xbtn-sm xbtn-default text-danger" Visible="false"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>

                </td>
            </tr>
        </ItemTemplate>
        <SelectedItemTemplate>
            <tr class="sit">
                <td class="control1">
                    <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select"><i class="glyphicon glyphicon-check checker checked"></i></asp:LinkButton>
                </td>
                <td class="num">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="TypLabel" runat="server" Text='<%# Eval("Typ") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaENLabel" runat="server" Text='<%# Eval("NazwaEN") %>' />
                </td>
                <td class="check">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Eval("Aktywna") %>' Enabled="false" />
                </td>
                <td class="control">
                    <%--                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="false" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-default" />--%>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn xbtn-sm xbtn-default text-danger" Visible="false"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>
                </td>
            </tr>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" class="tbKwalifikacje_edt">
                <tr>
                    <td>Proszę zaznaczyć klasyfikację...
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="iit">
                <td class="control1"></td>
                <td></td>
                <td class="num">
                    <asp:TextBox ID="TypTextBox" runat="server" Text='<%# Bind("Typ") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaENTextBox" runat="server" Text='<%# Bind("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Bind("Aktywna") %>' />
                </td>
                <td class="control">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-sm btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-sm btn-default" />
                </td>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            <tr class="eit">
                <td class="control1"></td>
                <td class="num">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="TypTextBox" runat="server" Text='<%# Bind("Typ") %>' Enabled='<%# IsSuperUser %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaENTextBox" runat="server" Text='<%# Bind("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Bind("Aktywna") %>' />
                </td>
                <td class="control">
                    <%--       <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-sm btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default btn-sm" />--%>
                    <asp:LinkButton ID="SaveButton" runat="server" CommandName="Update" CssClass="btn xbtn-sm xbtn-default text-success"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-ban-circle"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th2" runat="server">
                                </th>
                                <th id="Th10" runat="server">
                                    Id</th>
                                <th id="Th11" runat="server">
                                    Typ</th>
                                <th id="Th6" runat="server">
                                    Nazwa</th>
                                <th id="Th3" runat="server">
                                    Nazwa EN</th>
                                <th id="Th7" runat="server">
                                    Kolejność</th>
                                <th id="Th4" runat="server">
                                    Aktywna</th>
                                <th id="Th5" runat="server" class="control"> 
                                    </th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
                    
<%--                        <asp:DataPager ID="DataPager1" runat="server" >
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
--%>                        
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="dsGrupy" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
        DeleteCommand="DELETE FROM [UprawnieniaGrupy] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [UprawnieniaGrupy] ([Typ], [Nazwa], [Kolejnosc], [Aktywna], [NazwaEN], IdKwalifikacji) VALUES (@Typ, @Nazwa, @Kolejnosc, @Aktywna, @NazwaEN, @IdKwalifikacji)" 
        SelectCommand="SELECT * FROM [UprawnieniaGrupy] WHERE (IdKwalifikacji = @IdKwalifikacji) ORDER BY [Kolejnosc]" 
        UpdateCommand="UPDATE [UprawnieniaGrupy] SET [Typ] = @Typ, [Nazwa] = @Nazwa, [Kolejnosc] = @Kolejnosc, [Aktywna] = @Aktywna, [NazwaEN] = @NazwaEN, IdKwalifikacji = @IdKwalifikacji WHERE [Id] = @Id">
        <SelectParameters>
            <asp:ControlParameter ControlID="lvKwalifikacje" Name="IdKwalifikacji" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lvKwalifikacje" Name="IdKwalifikacji" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywna" Type="Boolean" />
            <asp:Parameter Name="NazwaEN" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lvKwalifikacje" Name="IdKwalifikacji" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywna" Type="Boolean" />
            <asp:Parameter Name="NazwaEN" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>





<%--    <br />--%>
    <div class="title">
        <asp:Label ID="Label3" runat="server" Text="Uprawnienia"></asp:Label>
    </div>
    <asp:ListView ID="lvUprawnienia" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource3" InsertItemPosition='<%# GetInsertItemPositionUpr() %>'>
        <ItemTemplate>
            <tr class="it">
                <td class="num">
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
<%--
                <td>
                    <asp:Label ID="TypLabel" runat="server" Text='<%# Eval("Typ") %>' />
                </td>
                <td>
                    <asp:Label ID="KwalifikacjeIdLabel" runat="server" Text='<%# Eval("KwalifikacjeId") %>' />
                </td>
--%>
                <td>
                    <asp:Label ID="SymbolLabel" runat="server" Text='<%# Eval("Symbol") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaENLabel" runat="server" Text='<%# Eval("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="PoziomLabel" runat="server" Text='<%# Eval("Poziom") %>' />
                </td>
                <td>
                    <asp:Label ID="PoziomENLabel" runat="server" Text='<%# Eval("PoziomEN") %>' />
                </td>
                <td>
                    <asp:Label ID="OpisLabel" runat="server" Text='<%# Eval("Opis") %>' />
                </td>
                <td>
                    <%--<asp:Label ID="PolaLabel" runat="server" Text='<%# Eval("Pola") %>' />--%>
                    <asp:LinkButton ID="lnkPola" runat="server" Text="Pokaż pola" OnClick="ShowPola" CommandArgument='<%# Eval("Id") %>' style="color: green;" />
                </td>
                <td class="num">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywneCheckBox" runat="server" Checked='<%# Eval("Aktywne") %>' Enabled="false" />
                </td>
<%--
                <td>
                    <asp:CheckBox ID="ProdukcyjneCheckBox" runat="server" Checked='<%# Eval("Produkcyjne") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="NieprodukcyjneCheckBox" runat="server" Checked='<%# Eval("Nieprodukcyjne") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="PaszportSpawaczaCheckBox" runat="server" Checked='<%# Eval("PaszportSpawacza") %>' Enabled="false" />
                </td>
--%>
                <td class="num">
                    <asp:Label ID="PoziomIdLabel" runat="server" Text='<%# Eval("PoziomId") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="PoziomPoziomLabel" runat="server" Text='<%# Eval("PoziomPoziom") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="GrupaCheckBox" runat="server" Checked='<%# Eval("Grupa") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Wymagane") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("EwaluacjaPrac") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("EwaluacjaKier") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Eval("EwaluacjaKier2") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Eval("Oceniane") %>' Enabled="false" />
                </td>
                <td class="num">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("EwaluacjaPracDni") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("EwaluacjaKierDni") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("EwaluacjaKierDni2") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Eval("EwaluacjaMonitDniEdycja") %>' Enabled="false" />
                </td>
                <td class="control" style="width: 120px;">
                    <%--       <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="false"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-sm btn-default" />--%>
                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn xbtn-sm xbtn-default text-danger" Visible="true"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>
                    
                </td>
            </tr>
        </ItemTemplate>
        <SelectedItemTemplate>
            <tr class="sit">
                <td class="num">
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <%--
                <td>
                    <asp:Label ID="TypLabel" runat="server" Text='<%# Eval("Typ") %>' />
                </td>
                <td>
                    <asp:Label ID="KwalifikacjeIdLabel" runat="server" Text='<%# Eval("KwalifikacjeId") %>' />
                </td>
                --%>
                <td>
                    <asp:Label ID="SymbolLabel" runat="server" Text='<%# Eval("Symbol") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwaENLabel" runat="server" Text='<%# Eval("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="PoziomLabel" runat="server" Text='<%# Eval("Poziom") %>' />
                </td>
                <td>
                    <asp:Label ID="PoziomENLabel" runat="server" Text='<%# Eval("PoziomEN") %>' />
                </td>
                <td>
                    <asp:Label ID="OpisLabel" runat="server" Text='<%# Eval("Opis") %>' />
                </td>
                <td>
                    <asp:Label ID="PolaLabel" runat="server" Text='<%# Eval("Pola") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="KolejnoscLabel" runat="server" Text='<%# Eval("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywneCheckBox" runat="server" Checked='<%# Eval("Aktywne") %>' Enabled="false" />
                </td>
<%--
                <td>
                    <asp:CheckBox ID="ProdukcyjneCheckBox" runat="server" Checked='<%# Eval("Produkcyjne") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="NieprodukcyjneCheckBox" runat="server" Checked='<%# Eval("Nieprodukcyjne") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="PaszportSpawaczaCheckBox" runat="server" Checked='<%# Eval("PaszportSpawacza") %>' Enabled="false" />
                </td>
--%>                
                <td class="num">
                    <asp:Label ID="PoziomIdLabel" runat="server" Text='<%# Eval("PoziomId") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="PoziomPoziomLabel" runat="server" Text='<%# Eval("PoziomPoziom") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="GrupaCheckBox" runat="server" Checked='<%# Eval("Grupa") %>' Enabled="false" />
                </td>                <td class="check">
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Wymagane") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("EwaluacjaPrac") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("EwaluacjaKier") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Eval("EwaluacjaKier2") %>' Enabled="false" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Eval("Oceniane") %>' Enabled="false" />
                </td>
                <td class="num">
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("EwaluacjaPracDni") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("EwaluacjaKierDni") %>' />
                </td>
                <td class="num">
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("EwaluacjaKierDni2") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Eval("EwaluacjaMonitDniEdycja") %>' Enabled="false" />
                </td>
                <td class="control">
<%--                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" Visible="false" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />--%>
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-edit"></i></asp:LinkButton>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn xbtn-sm xbtn-default text-danger" Visible="true"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>
                </td>
            </tr>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" class="tbUprawnienia_edt">
                <tr>
                    <td>
                        Proszę zaznaczyć klasyfikację...
                     </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="iit">
                <td>
                </td>

<%--            <td>
                    <asp:TextBox ID="TypTextBox" runat="server" Text='<%# Bind("Typ") %>' />
                </td>
                <td>
                    <asp:TextBox ID="KwalifikacjeIdTextBox" runat="server" Text='<%# Bind("KwalifikacjeId") %>' />
                </td>
--%>                
                <td>
                    <asp:TextBox ID="SymbolTextBox" runat="server" Text='<%# Bind("Symbol") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaENTextBox" runat="server" Text='<%# Bind("NazwaEN") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="PoziomTextBox" runat="server" Text='<%# Bind("Poziom") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PoziomENTextBox" runat="server" Text='<%# Bind("PoziomEN") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OpisTextBox" runat="server" Text='<%# Bind("Opis") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PolaTextBox" runat="server" Text='<%# Bind("Pola") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywneCheckBox" runat="server" Checked='<%# Bind("Aktywne") %>' />
                </td>
<%--
                <td>
                    <asp:CheckBox ID="ProdukcyjneCheckBox" runat="server" Checked='<%# Bind("Produkcyjne") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="NieprodukcyjneCheckBox" runat="server" Checked='<%# Bind("Nieprodukcyjne") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="PaszportSpawaczaCheckBox" runat="server" Checked='<%# Bind("PaszportSpawacza") %>' />
                </td>
--%>
                <td class="num">
                    <asp:TextBox ID="PoziomIdTextBox" runat="server" Text='<%# Bind("PoziomId") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="PoziomPoziomTextBox" runat="server" Text='<%# Bind("PoziomPoziom") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="GrupaCheckBox" runat="server" Checked='<%# Bind("Grupa") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Wymagane") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("EwaluacjaPrac") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("EwaluacjaKier") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("EwaluacjaKier2") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Oceniane") %>' Enabled="true" />
                </td>
                <td class="num">
                    <asp:TextBox ID="Label7" runat="server" Text='<%# Bind("EwaluacjaPracDni") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="Label6" runat="server" Text='<%# Bind("EwaluacjaKierDni") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="Label8" runat="server" Text='<%# Bind("EwaluacjaKierDni2") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("EwaluacjaMonitDniEdycja") %>' Enabled="true" />
                </td>
                <td class="control">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-sm btn-success" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            <tr class="eit">
                <td class="num">
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>                
<%--
                <td>
                    <asp:TextBox ID="TypTextBox" runat="server" Text='<%# Bind("Typ") %>' />
                </td>
                <td>
                    <asp:TextBox ID="KwalifikacjeIdTextBox" runat="server" Text='<%# Bind("KwalifikacjeId") %>' />
                </td>
--%>                
                <td>
                    <asp:TextBox ID="SymbolTextBox" runat="server" Text='<%# Bind("Symbol") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwaENTextBox" runat="server" Text='<%# Bind("NazwaEN") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PoziomTextBox" runat="server" Text='<%# Bind("Poziom") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PoziomENTextBox" runat="server" Text='<%# Bind("PoziomEN") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OpisTextBox" runat="server" Text='<%# Bind("Opis") %>' />
                </td>
                <td>
                    <%--<asp:TextBox ID="PolaTextBox" runat="server" Text='<%# Bind("Pola") %>' />--%>
                    <asp:Button ID="btnEditFields" runat="server" OnClick="btnEditFields_Click" Text="Edytuj pola" CssClass="btn btn-sm btn-primary" CommandArgument='<%# Eval("Id") %>'  Enabled='<%# IsSuperUser %>'  />
                </td>
                <td class="num">
                    <asp:TextBox ID="KolejnoscTextBox" runat="server" Text='<%# Bind("Kolejnosc") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="AktywneCheckBox" runat="server" Checked='<%# Bind("Aktywne") %>' />
                </td>
<%--
                <td>
                    <asp:CheckBox ID="ProdukcyjneCheckBox" runat="server" Checked='<%# Bind("Produkcyjne") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="NieprodukcyjneCheckBox" runat="server" Checked='<%# Bind("Nieprodukcyjne") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="PaszportSpawaczaCheckBox" runat="server" Checked='<%# Bind("PaszportSpawacza") %>' />
                </td>
--%>                
                <td class="num">
                    <asp:TextBox ID="PoziomIdTextBox" runat="server" Text='<%# Bind("PoziomId") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="PoziomPoziomTextBox" runat="server" Text='<%# Bind("PoziomPoziom") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="GrupaCheckBox" runat="server" Checked='<%# Bind("Grupa") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Wymagane") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("EwaluacjaPrac") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("EwaluacjaKier") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# Bind("EwaluacjaKier2") %>' Enabled="true" />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("Oceniane") %>' Enabled="true" />
                </td>
                <td class="num">
                    <asp:TextBox ID="Label7" runat="server" Text='<%# Bind("EwaluacjaPracDni") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="Label6" runat="server" Text='<%# Bind("EwaluacjaKierDni") %>' />
                </td>
                <td class="num">
                    <asp:TextBox ID="Label8" runat="server" Text='<%# Bind("EwaluacjaKierDni2") %>' />
                </td>
                <td class="check">
                    <asp:CheckBox ID="CheckBox5" runat="server" Checked='<%# Bind("EwaluacjaMonitDniEdycja") %>' Enabled="true" />
                </td>
                <td class="control" style="width: 145px;">
                <%--    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-sm btn-success" style="display: inline-block;"  />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-sm btn-default" style="display: inline-block;" />--%>
                      <asp:LinkButton ID="SaveButton" runat="server" CommandName="Update" CssClass="btn xbtn-sm xbtn-default text-success"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
  <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn xbtn-sm xbtn-default"><i class="glyphicon glyphicon-ban-circle"></i></asp:LinkButton>
                      <asp:LinkButton ID="btnTransfer" runat="server" OnClick="btnTransfer_Click" CommandArgument='<%# Eval("Id") %>' CssClass="btn xbtn-sm xbtn-default text-default">
                          <i class="glyphicon glyphicon-move"></i></asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="xtbUprawnieniaWide" >
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" class="table" style="margin-left: 0px;" >
                            <tr runat="server" style="">
                                <th id="Th8" runat="server">
                                    Id</th>
<%--
                                <th id="Th9" runat="server">
                                    Typ</th>
                                <th id="Th2" runat="server">
                                    KwalifikacjeId</th>
--%>                                    
                                <th runat="server">
                                    Symbol</th>
                                <th runat="server">
                                    Nazwa</th>
                                <th runat="server">
                                    Nazwa EN</th>
                                <th runat="server">
                                    Poziom</th>
                                <th runat="server">
                                    Poziom EN</th>
                                <th runat="server">
                                    Opis</th>
                                <th runat="server">
                                    Pola</th>
                                <th runat="server">
                                    Kolejność</th>
                                <th runat="server">
                                    Aktywne</th>
<%--
                                <th runat="server">
                                    Produkcyjne</th>
                                <th runat="server">
                                    Nieprodukcyjne</th>
                                <th runat="server">
                                    PaszportSpawacza</th>
--%>
                                <th runat="server">
                                    Poziom Id</th>
                                <th runat="server">
                                    Poziom</th>
                                <th runat="server">
                                    Grupa</th>
                                <th runat="server">
                                    Wymagane</th>
                                <th runat="server">
                                    E. P.</th>
                                <th runat="server">
                                    E. K.</th>
                                <th runat="server">
                                    E. K. 2</th>
                                <th runat="server">
                                    Oceniane</th>
                                <th runat="server">
                                    E. P. dni</th>
                                <th runat="server">
                                    E. K dni</th>
                                <th runat="server">
                                    E. K 2 dni</th>
                                <th runat="server">
                                    E. Edycja</th>
                                <th runat="server">
                                    </th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr runat="server" class="pager">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
             <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nav" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" FirstPageText="Pierwsza" PreviousPageText="Poprzednia" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" ButtonCssClass="nav" ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowLastPageButton="true" ShowNextPageButton="true" NextPageText="Następna" LastPageText="Ostatnia" />
               
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
                <br />
            </table>
        </LayoutTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" CancelSelectOnNullParameter="false"
        DeleteCommand="DELETE FROM [Uprawnienia] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Uprawnienia] ([Typ], [Symbol], [Nazwa], [NazwaEN], [Poziom], [PoziomEN], [Opis], /*[Pola], */[Kolejnosc], [Aktywne], [KwalifikacjeId]
        , [PoziomId], [PoziomPoziom], Grupa, IdGrupy, EwaluacjaPrac, EwaluacjaKier, EwaluacjaKier2, Oceniane, EwaluacjaMonitDniEdycja, EwaluacjaPracDni, EwaluacjaKierDni, EwaluacjaKierDni2) 
        
        VALUES (@Typ, @Symbol, @Nazwa, @NazwaEN, @Poziom, @PoziomEN, @Opis, /*@Pola,*/ @Kolejnosc, @Aktywne, @KwalifikacjeId, @PoziomId, @PoziomPoziom, @Grupa, @IdGrupy
        , @EwaluacjaPrac, @EwaluacjaKier, @EwaluacjaKier2, @Oceniane, @EwaluacjaMonitDniEdycja, @EwaluacjaPracDni, @EwaluacjaKierDni, @EwaluacjaKierDni2)" 
        SelectCommand="SELECT * FROM [Uprawnienia] WHERE Typ = @Typ and ISNULL(KwalifikacjeId, 0) = ISNULL(@KwalifikacjeId, 0) /*and ISNULL(IdGrupy, 0) = ISNULL(@IdGrupy, 0)*/ ORDER BY [Kolejnosc]" 
        UpdateCommand="UPDATE [Uprawnienia] SET [Typ] = @Typ, [Symbol] = @Symbol, [Nazwa] = @Nazwa, [NazwaEN] = @NazwaEN, [Poziom] = @Poziom, [PoziomEN] = @PoziomEN
        , [Opis] = @Opis, /*[Pola] = @Pola, */[Kolejnosc] = @Kolejnosc, [Aktywne] = @Aktywne, [KwalifikacjeId] = @KwalifikacjeId, [PoziomId] = @PoziomId, [PoziomPoziom] = @PoziomPoziom, Grupa = @Grupa
        , IdGrupy = ISNULL(@IdGrupy, IdGrupy), EwaluacjaPrac = @EwaluacjaPrac, EwaluacjaKier = @EwaluacjaKier, EwaluacjaKier2 = @EwaluacjaKier2, Oceniane = @Oceniane, EwaluacjaMonitDniEdycja = @EwaluacjaMonitDniEdycja
        , EwaluacjaPracDni = @EwaluacjaPracDni, EwaluacjaKierDni = @EwaluacjaKierDni, EwaluacjaKierDni2 = @EwaluacjaKierDni2 
         WHERE [Id] = @Id">
        <SelectParameters>
            <asp:ControlParameter ControlID="lvKwalifikacje" Name="KwalifikacjeId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lvGrupy" Name="IdGrupy" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lvGrupy" Name="IdGrupy" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Symbol" Type="String" />
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="NazwaEN" Type="String" />
            <asp:Parameter Name="Poziom" Type="String" />
            <asp:Parameter Name="PoziomEN" Type="String" />
            <asp:Parameter Name="Opis" Type="String" />
            <%--<asp:Parameter Name="Pola" Type="String" />--%>
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywne" Type="Boolean" />
            <asp:Parameter Name="Produkcyjne" Type="Boolean" />
            <asp:Parameter Name="Nieprodukcyjne" Type="Boolean" />
            <asp:Parameter Name="PaszportSpawacza" Type="Boolean" />
            <asp:ControlParameter ControlID="lvKwalifikacje" Name="KwalifikacjeId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="PoziomId" Type="Int32" />
            <asp:Parameter Name="PoziomPoziom" Type="Int32" />
            <asp:Parameter Name="Grupa" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaPrac" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaKier" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaKier2" Type="Boolean" />
            <asp:Parameter Name="Oceniane" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaMonitEdycja" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaPracDni" Type="Int32" />
            <asp:Parameter Name="EwaluacjaKierDni" Type="Int32" />
            <asp:Parameter Name="EwaluacjaKierDni2" Type="Int32" />

            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="lvTypy" Name="Typ" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="lvGrupy" Name="IdGrupy" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Symbol" Type="String" />
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="NazwaEN" Type="String" />
            <asp:Parameter Name="Poziom" Type="String" />
            <asp:Parameter Name="PoziomEN" Type="String" />
            <asp:Parameter Name="Opis" Type="String" />
            <%--<asp:Parameter Name="Pola" Type="String" />--%>
            <asp:Parameter Name="Kolejnosc" Type="Int32" />
            <asp:Parameter Name="Aktywne" Type="Boolean" />
            <asp:Parameter Name="Produkcyjne" Type="Boolean" />
            <asp:Parameter Name="Nieprodukcyjne" Type="Boolean" />
            <asp:Parameter Name="PaszportSpawacza" Type="Boolean" />
            <asp:ControlParameter ControlID="lvKwalifikacje" Name="KwalifikacjeId" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="PoziomId" Type="Int32" />
            <asp:Parameter Name="PoziomPoziom" Type="Int32" />
            <asp:Parameter Name="Grupa" Type="Boolean" />            
            
            <asp:Parameter Name="EwaluacjaPrac" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaKier" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaKier2" Type="Boolean" />
            <asp:Parameter Name="Oceniane" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaMonitEdycja" Type="Boolean" />
            <asp:Parameter Name="EwaluacjaPracDni" Type="Int32" />
            <asp:Parameter Name="EwaluacjaKierDni" Type="Int32" />
            <asp:Parameter Name="EwaluacjaKierDni2" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>





<div id="divZoom" style="display:none;" class="modalPopup">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <cc:Pola id="Pola" runat="server" Visible="false" />
            <div class="bottom_buttons">
                <%--<asp:Button ID="btExcel" CssClass="button100" runat="server" Text="Excel" OnClick="btExcel_Click" Visible="true"/>--%>
                <asp:Button ID="btClose" CssClass="btn btn-sm btn-default" runat="server" Text="Zamknij" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

<div id="divTransfer" style="display:none;" class="modalPopup">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <cc:Transfer id="cTransfer" runat="server" Visible="false" OnTransfered="cTransfer_Transfered" />
            <div class="bottom_buttons">
                <asp:Button ID="btCloseTransfer" CssClass="btn btn-sm btn-default" runat="server" Text="Zamknij" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>



</div>