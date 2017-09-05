﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Report.Master" AutoEventWireup="true" CodeBehind="RepCCPracCC.aspx.cs" Inherits="HRRcp.Reports.RepCCPracCC" %>
<%@ Register src="~/Controls/Reports/cntReport.ascx" tagname="cntReport" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headReport" runat="server">
</asp:Content>

<%--
raport - cc pracownika
p1 - od
p2 - do
p3 -     - dowolna watosc - zgodnosc z RepCCPracDni
p4 - zakres: 0 - wszystko, 1 - czaszm, 50 - nadg 50, 100 - nadg 100, 150 - nadg łącznie, 2 - nocne, 3 - wszystkie dopełnienia
p5 - logo pracownika
p6 - split 019: 1 podzielony, 0 niepodzielony
p7 - 1 z dopełnieniami, 0 bez dopełnień 
--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderReport" runat="server">
    <uc1:cntReport ID="cntReport1" runat="server" 
        Title="select 'Czas przepracowany na wszystkie CC' + ' - ' + KadryId + ' ' + Nazwisko + ' ' + Imie from Pracownicy where KadryId='@p5'"
        Title2="Okres: @p1 do @p2"
        Title3="select
case when @p6=1 then '019 podzielone' else '019 niepodzielone' end +
case when @p7=1 then '' else ', bez dopełnień wynikających z zaokrągleń' end
        "
        SQL1="
join ccPrawa PR on PR.UserId = @UserId and PR.CC = S.CC
join ccPrawa PC on PC.UserId = @UserId and PC.CC = S.Class
        "
        P2="
,round(S.StawkaGodz, 4) as [Stawka godz.:N0.0000],
ISNULL(round(sum(S.vNadg50  * S.StawkaGodz * 1.5),2),0) as [Kwota 50:N0.00S], 
ISNULL(round(sum(S.vNadg100 * S.StawkaGodz * 2)  ,2),0) as [Kwota 100:N0.00S],
ISNULL(round(sum(S.vNocne   * S.StawkaNocna)     ,2),0) as [Kwota Nocne:N0.00S],

ISNULL(round(sum(S.vNadg50  * S.StawkaGodz * 1.5),2),0) +
ISNULL(round(sum(S.vNadg100 * S.StawkaGodz * 2)  ,2),0) as [Koszt 50+100:N0.00S],

ISNULL(round(sum(S.vNadg50  * S.StawkaGodz * 1.5),2),0) +
ISNULL(round(sum(S.vNadg100 * S.StawkaGodz * 2)  ,2),0) +
ISNULL(round(sum(S.vNocne   * S.StawkaNocna)     ,2),0) as [Suma kosztów:N0.00S]
        "                
        SQL="
declare @dataOd datetime
declare @dataDo datetime
set @dataOd = '@p1'
set @dataDo = '@p2'
        
select 
S.cc, CC.Nazwa,
'Wszystkie cc' as [|RepCCPracDni @p1 @p2 * 0 @p5 @p6 @p7|Czas przepracowany łącznie na wszystkie cc],
sum(S.vCzasZm)  as [Czas Zm:N0.00S|RepCCPracDni @p1 @p2 @cc 0 @p5 @p6 @p7|Dni przepracowane na cc],
sum(S.vNadg50)  as [Nadg 50:N0.00S|RepCCPracDni @p1 @p2 @cc 50 @p5 @p6 @p7|Dni z nadgodzinami 50 przepracowanymi na cc], 
sum(S.vNadg100) as [Nadg 100:N0.00S|RepCCPracDni @p1 @p2 @cc 100 @p5 @p6 @p7|Dni z nadgodzinami 100 przepracowanymi na cc], 
sum(S.vNadg50)  +
sum(S.vNadg100) as [Nadg 50+100:N0.00S|RepCCPracDni @p1 @p2 @cc 150 @p5 @p6 @p7|Dni z nadgodzinami (50+100) przepracowanymi na cc], 
sum(S.vNocne)   as [Nocne:N0.00S|RepCCPracDni @p1 @p2 @cc 2 @p5 @p6 @p7|Dni przepracowane w nocy na cc]
    @SQL2
from VrepDaneMPK S
    @SQL1
left outer join CC on CC.cc = S.CC
where S.Data between @dataOd and @dataDo and S.Logo='@p5'
and (
    (@p4 = 0) or (@p4 = 3) or
    (@p4 = 1 and S.vCzasZm > 0) or 
    (@p4 = 50 and S.vNadg50 > 0) or 
    (@p4 = 100 and S.vNadg100 > 0) or 
    (@p4 = 150 and (S.vNadg50 > 0 or S.vNadg100 > 0)) or 
    (@p4 = 2 and S.vNocne > 0) 
)
and (
    (@p6=1 and S.cc not in (select cc from CC where GrSplitu is not null))  -- bez 019, podzielone
 or (@p6=0 and S.Typ < 10)                                                  -- z 019, niepodzielone 
)
and (@p7=1 or S.Typ not in (3,13))  -- bez dopelnien
group by S.CC, CC.Nazwa, S.StawkaGodz
order by S.CC"/>
</asp:Content>

