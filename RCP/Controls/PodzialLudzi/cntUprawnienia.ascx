﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cntUprawnienia.ascx.cs" Inherits="HRRcp.Controls.PodzialLudzi.cntUprawnienia" %>

<div id="paUprawnienia" runat="server" class="cntUprawnienia">
    <div id="paFilter" runat="server" class="paFilter tbPracownicy2_filter" visible="true">
        <div class="left">
            <span class="label">Wyszukaj:</span>
            <asp:TextBox ID="tbSearch" CssClass="search textbox" runat="server" ></asp:TextBox>
            <asp:Button ID="btClear" runat="server" CssClass="button75" Text="Czyść" />
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btSearch" runat="server" CssClass="button_postback" Text="Wyszukaj" onclick="btSearch_Click" />
            <asp:GridView ID="gvUprawnienia" runat="server" CssClass="GridView1" 
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="true" 
                DataKeyNames="nrew:-" DataSourceID="SqlDataSource1" 
                ondatabound="gvUprawnienia_DataBound">
            </asp:GridView>
            <asp:Button ID="gvUprawnieniaCmd" runat="server" CssClass="button_postback" Text="Button" onclick="gvUprawnieniaCmd_Click" />
            <asp:HiddenField ID="gvUprawnieniaCmdPar" runat="server" />                            
            <div class="pager">
                <span class="count">Ilość:<asp:Label ID="lbCount" runat="server" ></asp:Label></span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="count">Pokaż na stronie:</span>
                <asp:DropDownList ID="ddlLines" runat="server" AutoPostBack="true"    
                    OnChange="showAjaxProgress();"
                    OnSelectedIndexChanged="ddlLines_SelectedIndexChanged">
                    <asp:ListItem Text="25" Value="25" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                    <asp:ListItem Text="WSZYSTKO" Value="all"></asp:ListItem>
                </asp:DropDownList>
            
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<%--
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
--%>

<asp:HiddenField ID="hidUserId" runat="server" Visible="false" />
<asp:HiddenField ID="hidUserAdm" runat="server" Visible="false" />

<%--
znaki do braku uprawnień:
—

--%>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
    onload="SqlDataSource1_Load" 
    onselected="SqlDataSource1_Selected"    
    SelectCommand="
declare 
    @colsH nvarchar(max), 
    @colsD nvarchar(max), 
    @stmt nvarchar(max)
/*
select  
    @colsH = isnull(@colsH + ',', '') + '[' + K.Nazwa + ']',
	@colsD = isnull(@colsD + ', ', '') + 'ISNULL([' + K.Nazwa + '],''-'') as [' + K.Nazwa + '|js:setPrawaCC(this 2 @pid ''' + K.Nazwa + ''');|Dodaj / usuń dostęp]'  
	from Kody K where Typ = 'PRACGRUPA'	
	order by Lp, Nazwa

select  
    @colsH = isnull(@colsH + ',', '') + '[' + 'Wyn' + K.Nazwa + ']',
	@colsD = isnull(@colsD + ', ', '') + 'ISNULL([' + 'Wyn' + K.Nazwa + '],''-'') as [' + 'Wynagrodzenie ' + K.Nazwa + '|js:setPrawaCC(this 4 @pid ''' + K.Nazwa + ''');|Dodaj / usuń dostęp]'  
	from Kody K where Typ = 'PRACGRUPA'	
	order by Lp, Nazwa
*/

select  
    @colsH = isnull(@colsH + ',', '') + '[' + K.Nazwa + '],[' + K.Nazwa + '$$$]',
	@colsD = isnull(@colsD + ',', '') + 
			 --'ISNULL([' + K.Nazwa + '],''-'') as [' + K.Nazwa + '|js:setPrawaCC(this 2 @pid ''' + K.Nazwa + ''');|Dodaj / usuń dostęp],' +
             --'case when [' + K.Nazwa + '$$$] is null then ''-'' else ''x'' end as [Wynagrodzenie ' + K.Nazwa + '|js:setPrawaCC(this 4 @pid ''' + K.Nazwa + '$$$'');|Dodaj / usuń dostęp]'
			 'ISNULL([' + K.Nazwa + '],' + case when R.Id is not null or @adm = 1 then '''-''' else '''''' end + ') as 
			         [' + K.Nazwa + '|'  + case when R.Id is not null or @adm = 1 then 'js:setPrawaCC(this 2 @pid ''' + K.Nazwa + ''');' else '' end + '|Dodaj / usuń dostęp],' +
             'case when [' + K.Nazwa + '$$$] is null then ' + case when W.Id is not null or @adm = 1 then '''-''' else '''''' end + ' else ''x'' end as              
                        [Wynagrodzenie ' + K.Nazwa + '|'    + case when W.Id is not null or @adm = 1 then 'js:setPrawaCC(this 4 @pid ''' + K.Nazwa + '$$$'');' else '' end + '|Dodaj / usuń dostęp]'
	from Kody K 
	left join ccPrawa R on R.UserId = @UserId and R.IdCC = 0 and R.CC = K.Nazwa 
	left join ccPrawa W on W.UserId = @UserId and W.IdCC = 0 and W.CC = K.Nazwa + '$$$'
	where K.Typ = 'PRACGRUPA'	
	order by K.Lp, K.Nazwa

if @adm = 1 begin
    set @colsH = @colsH + ',[ALL]'
    set @colsD = @colsD + ',''ALL'' as [ALL:;control|js:setPrawaCCAll(this 30 @pid ''ALL'');|Ustaw/wyzeruj dostęp do wszystkich cc]'
end

select 
    @colsH = isnull(@colsH + ',', '') + '[' + CC.cc + ']',
    --@colsD = isnull(@colsD + ',', '') + 'ISNULL([' + CC.cc + '],''-'') as [' + CC.cc + '|js:setPrawaCC(this 3 @pid ''' + CC.cc + ''');|' + CC.Nazwa + ']'  
    @colsD = isnull(@colsD + ',', '') + 'ISNULL([' + CC.cc + '],' + case when R.Id is not null or @adm = 1 then '''-''' else '''''' end + ') as 
                                                [' + CC.cc + '|'  + case when R.Id is not null or @adm = 1 then 'js:setPrawaCC(this 3 @pid ''' + CC.cc + ''');' else '' end + '|' + CC.Nazwa + ']'  
    from CC 
    left join ccPrawa R on R.UserId = @UserId and R.IdCC = CC.Id 
    order by CC.cc

--select @colsH
--select @colsD

select @stmt = '
SELECT 
    Sort as [Sort:-],
    Id as [pid:-],
    KadryId as [nrew:-], 
    Nazwisko as [nn:-],
    Imie as [ii:-],
    KadryId as [Nr ew.], 
    Pracownik as [Pracownik],
	
	case when ISNULL(SUBSTRING(Rights, 39, 1), 0) = 1 then ''x'' else ''-'' end [Podział Ludzi|js:setPrawaCC(this 1 @pid 38);|Dostęp do Podziału Ludzi - Dodaj / usuń dostęp],
	case when ISNULL(SUBSTRING(Rights, 40, 1), 0) = 1 then ''x'' else '''' end [Admin||Administracja Podziałem Ludzi],

	case when dbo.GetRightId(Rights, 40) = 1 then ''x'' else ''-'' end [Raporty PM|js:setPrawaCC(this 1 @pid 40);|Dostęp do raportów dla PM],
	case when dbo.GetRightId(Rights, 66) = 1 then ''x'' else ''-'' end [Raporty PM Zoom|js:setPrawaCC(this 1 @pid 66);|Dostęp do raportów dla PM - Zoom Pracownicy],
	case when dbo.GetRightId(Rights, 52) = 1 then ''x'' else ''-'' end [Raport limitów na CC|js:setPrawaCC(this 1 @pid 52);|Dostęp do raportów przekroczeń limitów na CC],
	case when dbo.GetRightId(Rights, 63) = 1 then ''x'' else ''-'' end [Raport ilości DL|js:setPrawaCC(this 1 @pid 63);|Dostęp do raportu ilości DL],
	case when dbo.GetRightId(Rights, 44) = 1 then ''x'' else ''-'' end [Mailing przesunięć na CC|js:setPrawaCC(this 1 @pid 44);|Powiadomienie o przesunięciu pracownika z/na cc],

	case when dbo.GetRightId(Rights, 41) = 1 then ''x'' else ''-'' end [Edycja splitów|js:setPrawaCC(this 1 @pid 41);|Korygowanie splitów pracowników],
	case when dbo.GetRightId(Rights, 42) = 1 then ''x'' else ''-'' end [Edycja słowników|js:setPrawaCC(this 1 @pid 42);|Edycja słowników CC Commodity Area Position],
    case when dbo.GetRightId(Rights, 43) = 1 then ''x'' else ''-'' end [Edycja splitów grup|js:setPrawaCC(this 1 @pid 43);|Wprowadzanie splitów dla grup cc],
	
	--case when ISNULL(SUBSTRING(Rights, 7, 1), 0) = 1 then ''x'' else ''-'' end [Raporty Podział CC|js:setPrawaCC(this 1 @pid ''6'');|Dostęp do raportów podziału czasu pracy na cc - Dodaj / usuń dostęp],
	--case when ISNULL(SUBSTRING(Rights, 8, 1), 0) = 1 then ''x'' else ''-'' end [Koszty CC|js:setPrawaCC(this 1 @pid ''7'');|Dostęp do podziału kwot na cc - Dodaj / usuń dostęp],
	--case when ISNULL(SUBSTRING(Rights, 9, 1), 0) = 1 then ''x'' else ''-'' end [Cała klasyfikacja|js:setPrawaCC(this 1 @pid ''8'');|Dostęp do wszystkich klasyfikacji - Dodaj / usuń dostęp],
    ' + @colsD + '
    ,Pracownik as [Pracownik.]
FROM
(
	select 
	P.Id,
	P.KadryId, P.Nazwisko + '' '' + P.Imie + case when P.Admin = 1 then '' (ADM)'' else '''' end as Pracownik,
	P.Nazwisko, P.Imie,
    P.Kierownik,
	P.Rights,
	--ISNULL(SUBSTRING(P.Rights, 7, 1), 0) as r6,
	--ISNULL(SUBSTRING(P.Rights, 8, 1), 0) as r7,
	--ISNULL(SUBSTRING(P.Rights, 9, 1), 0) as r8,
	R.CC,
	case when 
		SUBSTRING(P.Rights, 7, 1) = ''1'' or	
		SUBSTRING(P.Rights, 8, 1) = ''1'' or
		SUBSTRING(P.Rights, 9, 1) = ''1'' or
		R.Id is not null
	then 
	    case 
	        --when SUBSTRING(P.Rights, 9, 1) = ''1'' then 1 
	        when SUBSTRING(P.Rights, 7, 1) = ''1'' then 2	
		else 9 end	
	else 10 end as Sort
	from Pracownicy P
	left outer join ccPrawa R on R.UserId = P.Id
	left outer join CC on CC.cc = R.CC
	where P.Status != -1 and --KadryId &lt; 80000 and KadryId &gt;= 0 and
	    (
	    P.Kierownik = 1 or P.Admin = 1 or P.Raporty = 1 or
		SUBSTRING(P.Rights, 7, 1) = ''1'' or	
		SUBSTRING(P.Rights, 8, 1) = ''1'' or
		SUBSTRING(P.Rights, 9, 1) = ''1'' or
		R.Id is not null
		)
) as D
PIVOT
(
	max(D.CC) FOR D.CC IN (' + @colsH + ')
) as PV
order by Sort, Pracownik'

exec sp_executesql @stmt
    " onfiltering="SqlDataSource1_Filtering" 
    onprerender="SqlDataSource1_PreRender">
    <SelectParameters>
        <asp:ControlParameter ControlID="hidUserId" Name="UserId" PropertyName="Value" Type="Int32" />
        <asp:ControlParameter ControlID="hidUserAdm" Name="adm" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>


<%--
declare 
    @colsH nvarchar(max), 
    @colsD nvarchar(max), 
    @stmt nvarchar(max)

select  
    @colsH = isnull(@colsH + ',', '') + '[' + TypImport + ']',
	@colsD = isnull(@colsD + ', ', '') + 'ISNULL([' + TypImport + '],''-'') as [' + TypImport + '|js:setPrawaCC(this 2 @pid ''' + TypImport + ''');|Dodaj / usuń dostęp]'  
	from 
	(
	select distinct TypImport, case TypImport when 'DL' then '1' when 'BUIL' then '2' when 'SG&A' then '3' else '4' end as Sort
	from PodzialLudziImport
	) D
	order by Sort, TypImport

select 
    @colsH = isnull(@colsH + ',', '') + '[' + CC.cc + ']',
    @colsD = isnull(@colsD + ',', '') + 'ISNULL([' + CC.cc + '],''-'') as [' + CC.cc + '|js:setPrawaCC(this 3 @pid ''' + CC.cc + ''');|' + CC.Nazwa + ']'  
    from CC 
    order by CC.cc

--select @colsH
--select @colsD

select @stmt = '
SELECT 
    Sort as [Sort:-],
    Id as [pid:-],
    KadryId as [nrew:-], 
    KadryId as [Nr ew.], 
    Pracownik as [Kierownik:C],
	
	case when ISNULL(SUBSTRING(Rights, 39, 1), 0) = 1 then ''x'' else ''-'' end [Podział Ludzi|js:setPrawaCC(this 1 @pid 38);|Dostęp do Podziału Ludzi - Dodaj / usuń dostęp],
	case when ISNULL(SUBSTRING(Rights, 7, 1), 0) = 1 then ''x'' else ''-'' end [Raporty Podział CC|js:setPrawaCC(this 1 @pid ''6'');|Dostęp do raportów podziału czasu pracy na cc - Dodaj / usuń dostęp],
	case when ISNULL(SUBSTRING(Rights, 8, 1), 0) = 1 then ''x'' else ''-'' end [Koszty CC|js:setPrawaCC(this 1 @pid ''7'');|Dostęp do podziału kwot na cc - Dodaj / usuń dostęp],
	case when ISNULL(SUBSTRING(Rights, 9, 1), 0) = 1 then ''x'' else ''-'' end [Cała klasyfikacja|js:setPrawaCC(this 1 @pid ''8'');|Dostęp do wszystkich klasyfikacji - Dodaj / usuń dostęp],
    ' + @colsD +
'FROM
(
	select 
	P.Id,
	P.KadryId, P.Nazwisko + '' '' + P.Imie + case when P.Admin = 1 then '' (ADM)'' else '''' end as Pracownik,
    P.Kierownik,
	P.Rights,
	--ISNULL(SUBSTRING(P.Rights, 7, 1), 0) as r6,
	--ISNULL(SUBSTRING(P.Rights, 8, 1), 0) as r7,
	--ISNULL(SUBSTRING(P.Rights, 9, 1), 0) as r8,
	R.CC,
	case when 
		SUBSTRING(P.Rights, 7, 1) = ''1'' or	
		SUBSTRING(P.Rights, 8, 1) = ''1'' or
		SUBSTRING(P.Rights, 9, 1) = ''1'' or
		R.Id is not null
	then 
	    case 
	        --when SUBSTRING(P.Rights, 9, 1) = ''1'' then 1 
	        when SUBSTRING(P.Rights, 7, 1) = ''1'' then 2	
		else 9 end	
	else 10 end as Sort
	from Pracownicy P
	left outer join ccPrawa R on R.UserId = P.Id
	left outer join CC on CC.cc = R.CC
	where P.Status != -1 and KadryId &lt; 80000 and KadryId &gt;= 0 and
	    (
	    P.Kierownik = 1 or P.Admin = 1 or P.Raporty = 1 or
		SUBSTRING(P.Rights, 7, 1) = ''1'' or	
		SUBSTRING(P.Rights, 8, 1) = ''1'' or
		SUBSTRING(P.Rights, 9, 1) = ''1'' or
		R.Id is not null
		)
) as D
PIVOT
(
	max(D.CC) FOR D.CC IN (' + @colsH + ')
) as PV
order by Sort, Pracownik'

exec sp_executesql @stmt
















-------------
declare 
    @colsH nvarchar(max), 
    @colsD nvarchar(max), 
    @stmt nvarchar(max)

select  
    @colsH = isnull(@colsH + ',', '') + '[' + TypImport + ']',
	@colsD = isnull(@colsD + ', ', '') + 'ISNULL([' + TypImport + '],''-'') as [' + TypImport + '|js:setPrawaCC(this 2 @pid ''' + TypImport + ''');|Dodaj / usuń dostęp]'  
	from 
	(
	select distinct TypImport, case TypImport when 'DL' then '1' when 'BUIL' then '2' when 'SG&A' then '3' else '4' end as Sort
	from PodzialLudziImport
	) D
	order by Sort, TypImport

select 
    @colsH = isnull(@colsH + ',', '') + '[' + CC.cc + ']',
    @colsD = isnull(@colsD + ',', '') + 'ISNULL([' + CC.cc + '],''-'') as [' + CC.cc + '|js:setPrawaCC(this 3 @pid ''' + CC.cc + ''');|' + CC.Nazwa + ']'  
    from CC 
    order by CC.cc

--select @colsH
--select @colsD

select @stmt = '
SELECT 
    Sort as [Sort:-],
    Id as [pid:-],
    KadryId as [nrew:-], 
    KadryId as [Nr ew.], 
    Pracownik as [Kierownik],
	
	case when ISNULL(SUBSTRING(Rights, 7, 1), 0) = 1 then ''x'' else ''-'' end [Podział CC|js:setPrawaCC(this 1 @pid 6);|Dostęp do raportów podziału czasu pracy na cc - Dodaj / usuń dostęp],
	case when ISNULL(SUBSTRING(Rights, 8, 1), 0) = 1 then ''x'' else ''-'' end [Koszty CC|js:setPrawaCC(this 1 @pid 7);|Dostęp do podziału kwot na cc - Dodaj / usuń dostęp],
	case when ISNULL(SUBSTRING(Rights, 9, 1), 0) = 1 then ''x'' else ''-'' end [Cała klasyfikacja|js:setPrawaCC(this 1 @pid 8);|Dostęp do wszystkich klasyfikacji - Dodaj / usuń dostęp],
	case when ISNULL(SUBSTRING(Rights, 39, 1), 0) = 1 then ''x'' else ''-'' end [Podział Ludzi|js:setPrawaCC(this 1 @pid 38);|Dostęp do Podziału Ludzi - Dodaj / usuń dostęp],
    ' + @colsD +
'FROM
(
	select 
	P.Id,
	P.KadryId, P.Nazwisko + '' '' + P.Imie as Pracownik,
    P.Kierownik,
	P.Rights,
	--ISNULL(SUBSTRING(P.Rights, 7, 1), 0) as r6,
	--ISNULL(SUBSTRING(P.Rights, 8, 1), 0) as r7,
	--ISNULL(SUBSTRING(P.Rights, 9, 1), 0) as r8,
	R.CC,
	case when 
		SUBSTRING(P.Rights, 7, 1) = ''1'' or	
		SUBSTRING(P.Rights, 8, 1) = ''1'' or
		SUBSTRING(P.Rights, 9, 1) = ''1'' or
		R.Id is not null
	then 
	    case 
	        --when SUBSTRING(P.Rights, 9, 1) = ''1'' then 1 
	        when SUBSTRING(P.Rights, 7, 1) = ''1'' then 2	
		else 9 end	
	else 10 end as Sort
	from Pracownicy P
	left outer join ccPrawa R on R.UserId = P.Id
	left outer join CC on CC.cc = R.CC
	where P.Status &gt;= 0 and
	    (
	    P.Kierownik = 1 or P.Admin = 1 or P.Raporty = 1 or
		SUBSTRING(P.Rights, 7, 1) = ''1'' or	
		SUBSTRING(P.Rights, 8, 1) = ''1'' or
		SUBSTRING(P.Rights, 9, 1) = ''1'' or
		R.Id is not null
		)
) as D
PIVOT
(
	max(D.CC) FOR D.CC IN (' + @colsH + ')
) as PV
order by Sort, Pracownik'

exec sp_executesql @stmt
--%>


<%--

--select  
--    @colsH = isnull(@colsH + ',', '') + '[' + Class + ']',
--    --@colsD = isnull(@colsD + ', ', '') + 'ISNULL([' + Class + '],''-'') as [' + Class + '|RepCCUprawnienia 2 @nrew ' + Class + '|Dodaj / usuń dostęp]'  
--	@colsD = isnull(@colsD + ', ', '') + 'ISNULL([' + Class + '],''-'') as [' + Class + '|javascript:setPrawa(2,''@nrew'',''' + Class + ''');|Dodaj / usuń dostęp]'  
--	from PodzialLudziImport
--	group by Class 
--	order by Class

    --@colsD = isnull(@colsD + ',', '') + 'ISNULL([' + CC.cc + '],''-'') as [' + CC.cc + '|RepCCUprawnienia 3 @nrew ' + CC.cc + '|' + CC.Nazwa + ']'  


--%>