﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateRange.ascx.cs" Inherits="HRRcp.Controls.DateRange" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<div class="daterange">
    Okres od: 
    <asp:TextBox ID="tbDataOd" CssClass="textbox" Width="120" runat="server" ></asp:TextBox>
    <asp:ImageButton ID="btDateOd" class="ico" runat="server" ImageUrl="~/images/buttons/calendar.png" />
    <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
        TargetControlID="tbDataOd" DaysModeTitleFormat="yyyy MMMM" PopupPosition="BottomLeft" 
        TodaysDateFormat="yyyy-MM-dd" CssClass="calendar"></asp:CalendarExtender>
    <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
        TargetControlID="tbDataOd" DaysModeTitleFormat="yyyy MMMM" PopupButtonID="btDateOd" 
        TodaysDateFormat="yyyy-MM-dd" CssClass="calendar"></asp:CalendarExtender>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;do: 
    <asp:TextBox ID="tbDataDo" CssClass="textbox" Width="120" runat="server" ></asp:TextBox>
    <asp:ImageButton ID="btDateDo" class="ico" runat="server" ImageUrl="~/images/buttons/calendar.png" />
    <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
        TargetControlID="tbDataDo" DaysModeTitleFormat="yyyy MMMM" PopupPosition="BottomLeft" 
        TodaysDateFormat="yyyy-MM-dd" CssClass="calendar"></asp:CalendarExtender>
    <asp:CalendarExtender ID="CalendarExtender4" runat="server" 
        TargetControlID="tbDataDo" DaysModeTitleFormat="yyyy MMMM" PopupButtonID="btDateDo" 
        TodaysDateFormat="yyyy-MM-dd" CssClass="calendar"></asp:CalendarExtender>
</div>