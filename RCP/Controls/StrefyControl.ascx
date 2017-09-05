﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StrefyControl.ascx.cs" Inherits="HRRcp.Controls.StrefyControl" %>
<%@ Register src="ReadersSelector.ascx" tagname="ReadersSelector" tagprefix="uc2" %>

<asp:HiddenField ID="hidStrefaId" runat="server" />

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
    DeleteCommand="DELETE FROM [Strefy] WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Strefy] ([Nazwa]) VALUES (@Nazwa)" 
    SelectCommand="SELECT * FROM [Strefy] ORDER BY [Nazwa]" 
    UpdateCommand="UPDATE [Strefy] SET [Nazwa] = @Nazwa WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Nazwa" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="Nazwa" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

<table width="100%">
    <tr>
        <td>
            <asp:ListView ID="lvStrefy" runat="server" 
                DataKeyNames="Id" 
                DataSourceID="SqlDataSource1" 
                InsertItemPosition="LastItem" 
                onselectedindexchanged="lvStrefy_SelectedIndexChanged" 
                ondatabound="lvStrefy_DataBound" onlayoutcreated="lvStrefy_LayoutCreated" 
                onload="lvStrefy_Load" onprerender="lvStrefy_PreRender">
                <ItemTemplate>
                    <tr class="it">
                        <td class="select">
                            <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Wybierz" />
                        </td>
                        <td>
                            <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Eval("Aktywna") %>' Enabled="false" />
                        </td>
                        <td class="control">
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edytuj" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>
                                Brak danych
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr class="iit">
                        <td class="select"></td>
                        <td>
                            <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Bind("Aktywna") %>' />
                        </td>
                        <td class="control">
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Dodaj" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Czyść" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server" class="ListView1 hoverline">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="Tr2" runat="server" style="">
                                        <th></th>
                                        <th id="Th1" runat="server">Nazwa</th>
                                        <th id="Th2" runat="server">Aktywna</th>
                                        <th id="Th3" runat="server"></th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style="">
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <EditItemTemplate>
                    <tr class="eit">
                        <td class="select"></td>
                        <td>
                            <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Bind("Aktywna") %>' />
                        </td>
                        <td class="control">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Zapisz" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <SelectedItemTemplate>
                    <tr class="sit">
                        <td class="select"></td>
                        <td>
                            <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="AktywnaCheckBox" runat="server" Checked='<%# Eval("Aktywna") %>' Enabled="false" />
                        </td>
                        <td class="control">
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edytuj" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

        </td>
        <td width="30">
        </td>
        <td>
            Obowiązuje od:<br />
            <asp:ListBox ID="lbDatyOd" Width="200" runat="server" AutoPostBack="true" onselectedindexchanged="lbDatyOd_SelectedIndexChanged" Rows="8"></asp:ListBox>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td valign="top">
            Rejestratory systemu kontroli dostępu (ROGER'Y)<br />
            <uc2:ReadersSelector ID="cntReaders" Mode="1" runat="server" />
        </td>
        <td valign="top">
            <br />
            <asp:Button ID="btAdd" class="button75" runat="server" Text="Dodaj ►" onclick="btAdd_Click" /><br />
            <asp:Button ID="btRemove" class="button75" runat="server" Text="Usuń ◄" onclick="btRemove_Click" /><br />
            <br />
        </td>
        <td valign="top">
            Rejestratory strefy RCP<br />
            <uc2:ReadersSelector ID="cntStrefaReaders" Mode="2" runat="server" />
            <br />
            Obowiązuje od: 
            <asp:TextBox ID="tbData" Width="120" runat="server"></asp:TextBox> 
            <asp:TextBox ID="tbCzas" Width="100" runat="server"></asp:TextBox><br />
            <asp:Button ID="btSave" class="button75" runat="server" Text="Zapisz" onclick="btSave_Click" />
            <asp:Button ID="btCancel" class="button75" runat="server" Text="Anuluj" onclick="btCancel_Click" />
            <asp:Button ID="btDelete" class="button75" runat="server" Text="Usuń" onclick="btDelete_Click" />
        </td>
    </tr>
</table>