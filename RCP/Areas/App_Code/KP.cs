﻿using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.Text;

namespace HRRcp.App_Code
{
    public class KP
    {
        public static string conStrKP = ConfigurationManager.ConnectionStrings["KPConnectionString"].ConnectionString;

        //--------------------------------------------------------------
        public static string insertData(DataRow dr, string drFieldName, string FieldName)
        {
            return insertData(dr, drFieldName, FieldName, false);
        }

        public static string updateData(DataRow dr, string drFieldName, string FieldName)
        {
            return updateData(dr, drFieldName, FieldName, false);
        }
        //--------------
        public static string insertData(DataRow dr, string drFieldName, string FieldName, bool last)
        {
            return Base.insertParam(Base.getValue(dr, drFieldName));
        }

        public static string updateData(DataRow dr, string drFieldName, string FieldName, bool last)
        {
            return Base.updateParam(FieldName, Base.getValue(dr, drFieldName));
        }

        //----------------------------------------
        public static string PrepareNazwisko(string n)
        {
            //return Tools.PrepareName(n);
            return n;
        }

        //-------------------------------------------------------------------------

        /*
        public static string cp1250ToUnicode(object str1250)
        {
            Encoding cp1250 = Encoding.GetEncoding(1250);
            byte[] buff = Encoding.Convert(cp1250,
                                           Encoding.Unicode,
                                           string. str1250

                                           cp1250.GetBytes(str1250));
            return Encoding.Unicode.GetString(buff);
        }
        */

        public static byte[] StrToByteArray(string str)
        {
            System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
            return encoding.GetBytes(str);
        }

        public static string ByteArrayToString(byte[] ba)
        {
            System.Text.UTF8Encoding enc = new System.Text.UTF8Encoding();
            return enc.GetString(ba);
        }


        public static byte[] Str1250ToByteArray(string str)
        {
            Encoding cp1250 = Encoding.GetEncoding(1250);
            return cp1250.GetBytes(str);
        }


        public static string a2s(byte[] ab)
        {
            string ret = "";
            for (int i = 0; i < ab.Count(); i++)
            {
                ret += ab[i].ToString("X") + " ";
            }
            return ret.Trim();
        }
        //-------------------------------------
        public static string pl(string s)  // problem z brakiem PL na serwerze
        {
            //¹æê³ñóœŸ¿¥ÆÊ£ÑÓŒ¯
            return s.Replace('¹', 'ą').
                     Replace('æ', 'ć').
                     Replace('ê', 'ę').
                     Replace('³', 'ł').
                     Replace('ñ', 'ń').
                     Replace('ó', 'ó').
                     Replace('œ', 'ś').
                     Replace('Ÿ', 'ź').
                     Replace('¿', 'ż').
                     Replace('¥', 'Ą').
                     Replace('Æ', 'Ć').
                     Replace('Ê', 'Ę').
                     Replace('£', 'Ł').
                     Replace('Ñ', 'Ń').
                     Replace('Ó', 'Ó').
                     Replace('Œ', 'Ś').
                     Replace('', 'Ź').
                     Replace('¯', 'Ż');
        }

        public static string getValuePL(DataRow dr, string field)
        {
            return pl(Base.getValue(dr, field));
        }

        public static string getValuePL(DataRow dr, int field)
        {
            return pl(Base.getValue(dr, field));
        }

        public static string insertStrParamPL(DataRow dr, string field)
        {
            return pl(Base.insertStrParam(dr, field));
        }

        public static string insertStrParamLastPL(DataRow drK, string field)
        {
            return pl(Base.insertStrParamLast(drK, field));
        }
        //----- RCP ----------------------------------------------------------------------
        //----- import KP
        public static int ImportPROJECTS(OdbcConnection conKP, SqlConnection con)  // nie używana
        {
            int cnt = 0;
            int d = 1;
            Base.execSQL(con, "delete from Projekty");
            DataSet ds = Base.getDataSet(conKP, "select * from PROJECTS");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string id = dr["PROJ_ID"].ToString();
                bool ok = Base.insertSQL2(con, "insert into Projekty (" +
                    "Id, NR_EW, Nazwa, PROJ_DATE, PROJ_ACT" +
                    ") values (" +
                        Base.insertParam(id) +
                        Base.insertStrParam(dr, "NR_EW") +
                        insertStrParamPL(dr, "PROJ_NAME") +
                        Base.insertDateParam(dr, "PROJ_DATE") +
                        Base.insertParamLast(dr, "PROJ_ACT") +
                    ")");
                if (!ok)
                {
                    d = -1;
                    Log.Error(Log.t2APP_IMPORTKP, "Import KP.PROJECTS", "PROJ_ID = " + id);
                }
                cnt++;
            }
            return cnt * d;
        }
        //------------------------------------------------------------------------------
        public static int ImportABSENCJA(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            int d = 1;
            Base.execSQL(con, "delete from Absencja");
            DataSet ds = Base.getDataSet(conKP, "select * from ABSENCJA where DATA_OD > '2011-11-01'");  // data startu systemu !!!

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                bool ok = Base.insertSQL2(con, "insert into Absencja (" +
                    "IdPracownika, NR_EW, DataOd, DataDo, IleDni, Godzin, Kod" +
                    ") values (" +
                        Base.insertParam("0") +
                        Base.insertStrParam(dr, "NR_EW") +
                        Base.insertDateParamYYYYMMDD(dr, "DATA_OD") +
                        Base.insertDateParamYYYYMMDD(dr, "DATA_DO") +
                        Base.insertParam(dr, "ILEDNI") +                        
                        Base.insertFloatParam(dr, "GODZIN") +
                        Base.insertParamLast(dr, "KOD_NIEOB") +
                    ")");
                if (!ok)
                {
                    d = -1;
                    Log.Error(Log.t2APP_IMPORTKP, "Import KP.ABSENCJA", null);
                }
                cnt++;
            }
            Base.execSQL(con, "update Absencja set IdPracownika = P.Id from Absencja A left outer join Pracownicy P on P.KadryId = A.NR_EW");
            return cnt * d;
        }

        public static int ImportKODYABS(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            int d = 1;
            Base.execSQL(con, "update AbsencjaKody set Status = 1");   // wszyscy jako starzy
            DataSet ds = Base.getDataSet(conKP, "select * from KODABS");
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string kod = Base.getValue(dr, "KOD_NIEOB");
                string nazwa = getValuePL(dr, "NAZWA");

                bool ok = Base.execSQL2(con,
                    Base.updateSql("AbsencjaKody", 1, "Nazwa,Status", "Kod={0}",
                                    kod, Base.strParam(nazwa), 0));
                if (!ok)
                {
                    ok = Base.insertSQL2(con,
                        Base.insertSql("AbsencjaKody", 0, "Kod, Nazwa, Symbol, Widoczny, Status",
                                        kod, Base.strParam(nazwa), Base.NULL, 1, 2));
                    if (!ok)
                    {
                        Log.Error(Log.t2APP_IMPORTKP, "Import KP.KODYABS", null);
                        d = -1;
                    }
                }
                cnt++;
            }
            return cnt * d;
        }
        //-------------------------------------------------------------------------

        /*
        public static int ImportKODYABS(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            Base.execSQL(con, "delete from AbsencjaKody");
            DataSet ds = Base.getDataSet(conKP, "select * from KODABS");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string nazwa = getValuePL(dr, "NAZWA");
                bool ok = Base.insertSQL2(con, "insert into AbsencjaKody (" +
                    "Kod, Nazwa" +
                    ") values (" +
                        Base.insertParam(dr, "KOD_NIEOB") +
                        Base.insertStrParamLast(nazwa) +
                    ")");
                if (!ok)
                {
                    Log.Error(Log.t2APP_IMPORTKP, "Import KP.KODYABS", null);
                }
                cnt++;
            }
            return cnt;
        }
        */

        public static int ImportKALENDAR(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            int d = 1;
            Base.execSQL(con, "delete from Kalendarz");
            DataSet ds = Base.getDataSet(conKP, "select * from KALENDAR");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string opis = getValuePL(dr, "OPIS");
                bool ok = Base.insertSQL2(con, "insert into Kalendarz(" +
                    "Data, Rodzaj, Opis" +
                    ") values (" +
                        Base.insertDateParamYYYYMMDD(dr, "DZIEN") +
                        Base.insertParam(dr, "RODZ") +      // 0 sobota, 1 niedziela, 2 święto
                        Base.insertStrParamLast(opis) +
                    ")");
                if (!ok)
                {
                    d = -1;
                    Log.Error(Log.t2APP_IMPORTKP, "Import KP.KALENDARZ", null);
                }
                cnt++;
            }
            return cnt * d;
        }

        public static int ImportCZASNOM(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            int d = 1;
            Base.execSQL(con, "delete from CzasNom");
            DataSet ds = Base.getDataSet(conKP, "select * from CZASNOM");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string rok = Base.getValue(dr, "ROK");
                string mc = Base.getValue(dr, "MC");
                if (mc.Length == 1) mc = "0" + mc;
                bool ok = Base.insertSQL2(con, "insert into CzasNom(" +
                    "Data, DniPrac" +
                    ") values (" +
                        Base.insertStrParam(rok + "-" + mc + "-01") +
                        Base.insertStrParamLast(dr, "DNI") +
                    ")");
                if (!ok)
                {
                    d = -1;
                    Log.Error(Log.t2APP_IMPORTKP, "Import KP.CZASNOM", null);
                }
                cnt++;
            }
            return cnt * d;
        }

        public static int ImportZBIOR(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            int d = 1;
            Base.execSQL(con, "delete from UrlopZbior");
            DataSet ds = Base.getDataSet(conKP, "select * from ZBIOR");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                bool ok = Base.insertSQL2(con, "insert into UrlopZbior(" +
                    "Rok,KadryId,UrlopNom,UrlopZaleg,UrlopWyk" +
                    ") values (" +
                        Base.insertParam(dr, "ROK") +
                        Base.insertStrParam(dr, "NR_EW") +
                        Base.insertParam(db.ISNULL(Base.getValue(dr, "URLOPNOM"), "0")) +
                        Base.insertParam(db.ISNULL(Base.getValue(dr, "URLOPZALEG"), "0")) +
                        Base.insertParamLast(db.ISNULL(Base.getValue(dr, "URLOPWYK"), "0")) +
                    ")");
                if (!ok)
                {
                    d = -1;
                    Log.Error(Log.t2APP_IMPORTKP, "Import KP.ZBIOR", null);
                }
                cnt++;
            }
            return cnt * d;
        }

        public static int ImportSTAWKI(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            DataSet ds = Base.getDataSet(conKP, "select * from PRACA");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string nr_ew = dr["NR_EW"].ToString();  // tylko ci którzy są
                string kid = Base.getScalar(con, "select Id from Pracownicy where KadryId = " + Base.strParam(nr_ew));
                if (!String.IsNullOrEmpty(kid))
                {
                    //string stawka = Base.getFloatAsString(dr, "STAWKA", Base.NULL);
                    //int? etatL = Base.getInt(dr, "ETATL");
                    //int? etatM = Base.getInt(dr, "ETATM");
                    bool ok = Base.execSQL(con, Base.updateSql("Pracownicy", 0,
                        "Stawka, EtatL, EtatM, DataZatr",
                        "KadryId=" + nr_ew,
                        Base.getFloatAsString(dr, "STAWKA", Base.NULL),
                        Base.getValue(dr, "ETATL"),
                        Base.getValue(dr, "ETATM"),
                        Base.nullStrParam(Base.DateToStr(dr["PRZYJ_DN"]))
                        //,Base.nullStrParam(Base.DateToStr(dr["DO_KIEDY"]))
                        //,Base.getValue(dr, "TYP_UMOWY")
                        //,Base.getValue(dr, "STANOW")
                        ));
                    //bool ok = Base.execSQL(con, "update Pracownicy set Stawka=" + stawka + " where KadryId=" + nr_ew);
                    if (!ok)
                    {
                        Log.Error(Log.t2APP_IMPORTKP, "Import KP.PRACA.STAWKI", nr_ew);
                    }
                    cnt++;
                }
            }
            return cnt;
        }

        public static int ImportNickPass(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            DataSet ds = Base.getDataSet(conKP, "select * from KADRY K left outer join PRACA P on P.NR_EW = K.NR_EW where P.DATA_ZWOL is null");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string nr_ew = dr["NR_EW"].ToString();  // tylko ci którzy są
                string kid = Base.getScalar(con, "select Id from Pracownicy where KadryId = " + Base.strParam(nr_ew));
                if (!String.IsNullOrEmpty(kid))
                {
                    //string stawka = Base.getFloatAsString(dr, "STAWKA", Base.NULL);
                    //int? etatL = Base.getInt(dr, "ETATL");
                    //int? etatM = Base.getInt(dr, "ETATM");
                    bool ok = Base.execSQL(con, Base.updateSql("Pracownicy", 0,
                        "Nick, Pass",
                        "KadryId=" + nr_ew,
                        db.strParam(Base.getValue(dr, "PESEL")),
                        db.strParam(FormsAuthentication.HashPasswordForStoringInConfigFile(Base.getValue(dr, "NR_AKT"), AppUser.hashMethod))
                        ));
                    //bool ok = Base.execSQL(con, "update Pracownicy set Stawka=" + stawka + " where KadryId=" + nr_ew);
                    if (!ok)
                        Log.Error(Log.t2APP_IMPORTKP, "Import KP.KADRY.NICKPASS", nr_ew);
                    else
                        cnt++;
                }
                else
                {
                    string nazwisko = Tools.PrepareName(Base.getValue(dr, "Nazwisko"));
                    string imie = Tools.PrepareName(Base.getValue(dr, "Imie"));
                    int pId = Base.insertSQL(con, Base.insertSql("Pracownicy", 0, 
                        "Nazwisko, Imie, Login, Email, Admin, Kierownik, KadryId, Status,Nick,Pass",
                        Base.strParam(nazwisko), 
                        Base.strParam(imie),
                        db.strParam("login_" + nr_ew),
                        db.strParam("email_" + nr_ew),
                        0, 0, 
                        db.strParam(nr_ew), 
                        -3,
                        db.strParam(Base.getValue(dr, "PESEL")),
                        db.strParam(FormsAuthentication.HashPasswordForStoringInConfigFile(Base.getValue(dr, "NR_AKT"), AppUser.hashMethod))
                        ));
                    if (pId == -1) // <<<< nie dodał... obsłużyć !!!, na razie loguje
                        Log.Error(Log.t2APP_IMPORTKP, "Import KP.KADRY.MNICKPASS.NEW", nr_ew + " " + nazwisko + " " + imie);
                    else
                        cnt++;
                }
            }
            return cnt;
        }
        //------ import ROGER ------
        public static int UpdatePracownicyRcpId(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            DataSet ds = Base.getDataSet(conKP, "select * from EMPLOYEE");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string nrew = dr["NR_EW"].ToString();
                string rcpid = dr["RCP_ID"].ToString();
                string pid = dr["PROJ_ID"].ToString();

                bool ok = Base.execSQL(con, "update Pracownicy set " +
                    Base.updateParam("IdProjektu", pid) +
                    Base.updateParamLast("RcpId", rcpid) +
                    "where KadryId = " + Base.strParam(nrew));
                if (!ok)
                {
                    Log.Error(Log.t2APP_IMPORTKP, "Update RCP.Pracownicy", "NR_EW = " + nrew);
                }
                cnt++;
            }
            return cnt;
        }





        //----- import PRP -----
        public static int UpdatePracownicyPRP(SqlConnection con)
        {
            int cnt = 0;
            DataSet ds = Base.getDataSet(con,
                "select P.KadryId, K.KadryId from HR_PRP.dbo.Pracownicy P " +
                "left outer join HR_PRP.dbo.Pracownicy K on P.IdKierownika = K.IdPracownika " +
                "where P.IdKierownika is not null");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string nrewP = dr[0].ToString().Trim();
                string nrewK = dr[1].ToString().Trim();
                if (!String.IsNullOrEmpty(nrewP) && !String.IsNullOrEmpty(nrewK))
                {
                    string kid = Base.getScalar(con, "select Id from Pracownicy where KadryId = " + Base.strParam("0" + nrewK));
                    if (!String.IsNullOrEmpty(kid))
                    {
                        bool ok = Base.execSQL(con, "update Pracownicy set " +
                                Base.updateParamLast("IdKierownika", kid) +
                            "where KadryId = " + Base.strParam("0" + nrewP));
                        if (!ok)
                        {
                            Log.Error(Log.t2APP_IMPORTKP, "Update RCP.Pracownicy from PRP", "NR_EW = " + nrewP);
                        }
                        cnt++;
                    }
                }
            }
            return cnt;
        }
        //----- import PWD -----
        public static int ImportPracownicy(SqlConnection con)
        {
            int cnt = 0;
            DataSet ds = Base.getDataSet(con, "select * from HR_CHECK.dbo.Pracownicy");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string nr_ew = dr["NR_EW"].ToString();
                string NR_EW = Base.strParam(nr_ew);
                string pracId = Base.getScalar(con, "select Id from Pracownicy where KadryId = " + NR_EW);
                if (String.IsNullOrEmpty(pracId))
                {
                    string nazwisko = Tools.PrepareName(Base.getValue(dr, "Nazwisko"));
                    string imie = Tools.PrepareName(Base.getValue(dr, "Imie"));
                    int pId = Base.insertSQL(con, "insert into Pracownicy (" +
                        "Nazwisko, Imie, Login, Email, Opis, Mailing, IdDzialu, IdStanowiska, IdKierownika, IdProjektu, Admin, Kierownik, KadryId, RcpId, Status" +
                        ") values (" +
                            Base.insertStrParam(nazwisko) +
                            Base.insertStrParam(imie) +
                            Base.insertStrParam(dr, "Login") +
                            Base.insertStrParam(dr, "Email") +
                            Base.insertParam(Base.NULL) +
                            Base.insertParam("1") +
                            Base.insertParam(Base.NULL) +
                            Base.insertParam(Base.NULL) +
                            Base.insertParam(Base.NULL) +
                            Base.insertParam(Base.NULL) +
                            Base.insertParam("0") +
                            Base.insertParam("0") +
                            Base.insertParam(NR_EW) +
                            Base.insertParam(Base.NULL) +
                            Base.insertParamLast("0") +
                        ")");
                    if (pId == -1) // <<<< nie dodał... obsłużyć !!!, na razie loguje
                    {
                        Log.Error(Log.t2APP_IMPORTKP, "Import PWD.Pracownicy", nr_ew + " " + nazwisko + " " + imie);
                    }
                    else
                    {
                        cnt++;
                    }
                }
                else // jest juz w bazie - nie zaciągam
                {
                }
            }
            return cnt;
        }





        //-------------------------------------------------------------------------------
        public static string ImportKADRY_test(OdbcConnection conKP, SqlConnection con)
        {
            //------ testy --------
            string ret = "";

            string text = "ąęćźż"; // unicode
            //Encoding win1250 = Encoding.GetEncoding("windows-1250");
            Encoding win1250 = Encoding.GetEncoding(1250);
            //Encoding unicode = Encoding.Default;
            Encoding unicode = Encoding.Unicode;

            byte[] unicodeBytes = unicode.GetBytes(text);
            byte[] win1250Bytes = Encoding.Convert(unicode, win1250, unicodeBytes);

            string win1250text = win1250.GetString(win1250Bytes);
            byte[] x = win1250.GetBytes(win1250text);

            //---------------------


            int cnt = 0;
            DataSet ds = Base.getDataSet(conKP, "select * from KADRY where STATUS = 0 or STATUS = 5");  // 0 - ok, 5 - weekendowy
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                //----- testy -----
                object on = dr["NAZWISKO"];
                object oi = dr["IMIE"];
                string sn = pl(on.ToString());
                string si = pl(oi.ToString());
                ret += " -> KP:" + sn + " " + si;




                /*

                System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
                return encoding.GetBytes(str);

                byte[] bn = StrToByteArray(sn);  // utf8
                byte[] bi = StrToByteArray(si);

                string uun = Encoding.GetEncoding(1250).GetString(bn);
                string uui = Encoding.GetEncoding(1250).GetString(bi);


                

                ret += " -> KP:" + sn + " " + si +
                         "  z utf8:" + a2s(bi) +
                         "  z 1250:" + a2s(bi1) +
                         "  z u:" + a2s(ubi) +
                         "  z unicode:" + a2s(buff) +
                         "  -> unicode: " + u2n + " " + u2i +
                         "  un: " + un + " " + ui +
                         "  uun: " + uun + " " + uui;






                string cn = (string)on;
                string ci = (string)oi;
                byte[] bn = StrToByteArray(sn);  // utf8
                byte[] bi = StrToByteArray(si);
                */
                /*
                System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
                return encoding.GetBytes(str);

                byte[] buff = Encoding.Convert(Encoding.UTF8,
                                   Encoding.Unicode,
                                   Encoding.UTF8.GetBytes(utf8));
                */

                //string uun = Encoding.UTF8.GetString(bn);
                //string uui = Encoding.UTF8.GetString(bi);




                /*
                string uun = Encoding.GetEncoding(1250).GetString(bn);
                string uui = Encoding.GetEncoding(1250).GetString(bi);



                byte[] bn1 = Str1250ToByteArray(sn);  // utf8
                byte[] bi1 = Str1250ToByteArray(si);
                string un = Tools.Utf8ToUnicode(sn);
                string ui = Tools.Utf8ToUnicode(si);
                byte[] ubn = StrToByteArray(un);
                byte[] ubi = StrToByteArray(ui);

                string u2n = Tools.cp1250ToUnicode(sn);
                string u2i = Tools.cp1250ToUnicode(si);


                Encoding cp1250 = Encoding.GetEncoding(1250);
                byte[] buff = Encoding.Convert(cp1250,
                                               Encoding.Unicode,
                                               cp1250.GetBytes(si));




                ret +=   " -> KP:" + sn + " " + si +
                         "  z utf8:" + a2s(bi) +
                         "  z 1250:" + a2s(bi1) +
                         "  z u:" + a2s(ubi) +
                         "  z unicode:" + a2s(buff) +
                         "  -> unicode: " + u2n + " " + u2i +
                         "  un: " + un + " " + ui +
                         "  uun: " + uun + " " + uui;
                


                /*
                Log.Info(Log.t2APP_INFO, "-> KP:" + sn + " " + si +
                                         "  z utf8:" + a2s(bi) +
                                         "  z 1250:" + a2s(bi1) +
                                         "  z u:" + a2s(ubi) + 
                                         "  z unicode:" + a2s(buff)
                                         ,
                                         "unicode: " + u2n + " " + u2i +
                                         "  un: " + un + " " + ui +  
                                         "  uun: " + uun + " " + uui   
                                          , Log.OK);
                */


                cnt++;
                if (cnt > 20) break;


                /*
                string nn = cp1250ToUnicode(dr["NAZWISKO"]);
                string ii = cp1250ToUnicode(dr["IMIE"]);
                Log.Info(Log.t2APP_INFO, "->" + nn + ' ' + ii, null, Log.OK);

                //string s = Encoding.UTF8.GetString(Encoding.GetEncoding("windows-1250").getBytes(s)) 
                //Encoding enc = Encoding.GetEncoding(1252); 
                //string result = enc.GetString(bytes);

                string N = Base.getValue(dr, "NAZWISKO");
                string I = Base.getValue(dr, "IMIE");
                Log.Info(Log.t2APP_INFO, N + ' ' + I, null, Log.OK);
                */

                //---------------------------                

                string NR_EW = Base.strParam(dr["NR_EW"].ToString());
                string pracId = Base.getScalar(con, "select Id from Pracownicy where NR_EW = " + NR_EW);
                if (String.IsNullOrEmpty(pracId))
                {
                    /*  !!!!!!!!!!!!1 właczyć !!!!!!!!!!!!1
                    int pId = Base.insertSQL(con, "insert into Pracownicy (" +
                        "Nazwisko, Imie, Login, Email, TelJabil, Status, Checked, Admin, Kontroler1, Kontroler2, Operator, StanAnkiety, NR_EW, PESEL, DATA_UR, MSC_UR, DOWOD, DOW_DWYD, DOW_DWAZ, DOW_WYD, IMIE_O, IMIE_M, NAZW_ROD, TEL, TEL_KOM, WYKSZT, IMIE_WSPM, NAZW_WSPM, PESEL_WSPM" +
                        ") values (" +                                                                  //[Id]
                            Base.insertStrParam(PrepareNazwisko(Base.getValue(dr, "NAZWISKO"))) +       //[Nazwisko]
                            Base.insertStrParam(PrepareNazwisko(Base.getValue(dr, "IMIE"))) +           //[Imie] 
                            Base.insertParam(Base.NULL) +                                               //[Login]
                            Base.insertParam(Base.NULL) +                                               //[Email]
                            Base.insertParam(Base.NULL) +                                               //[Email]
                            Base.insertParam("0") +                                                     //[Status]  
                            Base.insertParam("1") +                                                     //[Checked]
                            Base.insertParam("0") +                                                     //[Admin]
                            Base.insertParam("0") +                                                     //[Kontroler1]
                            Base.insertParam("0") +                                                     //[Kontroler2]
                            Base.insertParam("0") +                                                     //[Operator]
                            Base.insertParam("0") +                                                     //[StanAnkiety]
                            Base.insertStrParam(dr, "NR_EW") +                                          //[NR_EW]
                            Base.insertStrParam(dr, "PESEL") +                                          //[PESEL]
                            Base.insertDateParam(dr, "DATA_UR") +                                       //[DATA_UR]
                            Base.insertStrParam(dr, "MSC_UR") +                                         //[MSC_UR]
                            Base.insertStrParam(dr, "DOWOD") +                                          //[DOWOD]
                            Base.insertParam(Base.NULL) +                                               //[DOW_DWYD]
                            Base.insertParam(Base.NULL) +                                               //[DOW_DWAZ]
                            Base.insertStrParam(dr, "DOW_WYD") +                                        //[DOW_WYD]
                            Base.insertStrParam(dr, "IMIE_O") +                                         //[IMIE_O]
                            Base.insertStrParam(dr, "IMIE_M") +                                         //[IMIE_M]
                            Base.insertStrParam(dr, "NAZW_ROD") +                                       //[NAZW_ROD]
                            Base.insertStrParam(dr, "TEL") +                                            //[TEL]
                            Base.insertParam(Base.NULL) +                                               //[TEL_KOM]
                            Base.insertParam(Base.NULL) +                                               //[WYKSZT]
                            Base.insertParam(Base.NULL) +                                               //[IMIE_WSPM]
                            Base.insertParam(Base.NULL) +                                               //[NAZW_WSPM]
                            Base.insertParamLast(Base.NULL) +                                           //[PESEL_WSPM]
                        ")");
                    if (pId == -1) {} // <<<< obsłużyć !!!
                    cnt++;
                    pracId = pId.ToString();
                    ImportRODZINA(conKP, con, NR_EW, pracId, true);
                    ImportUMOWY(conKP, con, NR_EW, pracId, true);  // i aneksy
                    ImportSZKOLY(conKP, con, NR_EW, pracId);
                    ImportSTAZPRACY(conKP, con, NR_EW, pracId);
                    /**/
                }
                else
                {
                    /*
                    Base.execSQL(con, "update Pracownicy set " +
                        " where Id = " + pracId);

                    ImportRODZINA(conKP, con, NR_EW, pracId, false);
                    ImportUMOWY(conKP, con, NR_EW, pracId, false);  // i aneksy
                    ImportSZKOLY(conKP, con, NR_EW, pracId);
                    ImportSTAZPRACY(conKP, con, NR_EW, pracId);
                    */
                }
            }
            //return cnt;
            return ret;
        }



        //-------------------
        public static int ImportKADRY(OdbcConnection conKP, SqlConnection con, App.ProcessClass pc)
        {
            int cnt = 0;
            DataSet ds = Base.getDataSet(conKP, "select * from KADRY where STATUS = 0 or STATUS = 5");  // 0 - ok, 5 - weekendowy

            pc.Max = ds.Tables[0].Rows.Count;

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string nr_ew = dr["NR_EW"].ToString();
                string NR_EW = Base.strParam(nr_ew);
                string pracId = Base.getScalar(con, "select Id from Pracownicy where NR_EW = " + NR_EW);
                if (String.IsNullOrEmpty(pracId))
                {
                    string nazwisko = PrepareNazwisko(getValuePL(dr, "NAZWISKO"));
                    string imie = PrepareNazwisko(getValuePL(dr, "IMIE"));
                    int pId = Base.insertSQL(con, "insert into Pracownicy (" +
                        "Nazwisko, Imie, Login, Email, TelJabil, Status, Checked, Admin, Kontroler1, Kontroler2, Operator, StanAnkiety, NR_EW, PESEL, DATA_UR, MSC_UR, DOWOD, DOW_DWYD, DOW_DWAZ, DOW_WYD, IMIE_O, IMIE_M, NAZW_ROD, TEL, TEL_KOM, WYKSZT, IMIE_WSPM, NAZW_WSPM, PESEL_WSPM" +
                        ") values (" +                                                                  //[Id]
                            Base.insertStrParam(nazwisko) +                                             //[Nazwisko]
                            Base.insertStrParam(imie) +                                                 //[Imie] 
                            Base.insertParam(Base.NULL) +                                               //[Login]
                            Base.insertParam(Base.NULL) +                                               //[Email]
                            Base.insertParam(Base.NULL) +                                               //[Email]
                            Base.insertParam("0") +                                                     //[Status]  
                            Base.insertParam("1") +                                                     //[Checked]
                            Base.insertParam("0") +                                                     //[Admin]
                            Base.insertParam("0") +                                                     //[Kontroler1]
                            Base.insertParam("0") +                                                     //[Kontroler2]
                            Base.insertParam("0") +                                                     //[Operator]
                            Base.insertParam("0") +                                                     //[StanAnkiety]
                            Base.insertParam(NR_EW) +  // jest już w ''                                 //[NR_EW]
                            Base.insertStrParam(dr, "PESEL") +                                          //[PESEL]
                            Base.insertDateParamYYYYMMDD(dr, "DATA_UR") +                               //[DATA_UR]
                            insertStrParamPL(dr, "MSC_UR") +                                            //[MSC_UR]
                            Base.insertStrParam(dr, "DOWOD") +                                          //[DOWOD]
                            Base.insertParam(Base.NULL) +                                               //[DOW_DWYD]
                            Base.insertParam(Base.NULL) +                                               //[DOW_DWAZ]
                            insertStrParamPL(dr, "DOW_WYD") +                                           //[DOW_WYD]
                            insertStrParamPL(dr, "IMIE_O") +                                            //[IMIE_O]
                            insertStrParamPL(dr, "IMIE_M") +                                            //[IMIE_M]
                            insertStrParamPL(dr, "NAZW_ROD") +                                          //[NAZW_ROD]
                            Base.insertStrParam(dr, "TEL") +                                            //[TEL]
                            Base.insertParam(Base.NULL) +                                               //[TEL_KOM]
                            Base.insertParam(Base.NULL) +                                               //[WYKSZT]
                            Base.insertParam(Base.NULL) +                                               //[IMIE_WSPM]
                            Base.insertParam(Base.NULL) +                                               //[NAZW_WSPM]
                            Base.insertParamLast(Base.NULL) +                                           //[PESEL_WSPM]
                        ")");
                    if (pId == -1) // <<<< nie dodał... obsłużyć !!!, na razie loguje
                    {
                        Log.Error(pc.user, Log.t2APP_IMPORTKP, nr_ew + " " + nazwisko + " " + imie, "ImportKADRY");
                    }
                    else
                    {
                        cnt++;
                        pracId = pId.ToString();
                        ImportRODZINA(conKP, con, NR_EW, pracId, true, pc);
                        ImportUMOWY(conKP, con, NR_EW, pracId, true, pc);  // i aneksy
                        ImportSZKOLY(conKP, con, NR_EW, pracId, pc);
                        ImportSTAZPRACY(conKP, con, NR_EW, pracId, pc);
                    }
                    /**/
                }
                else
                {
                    // jest juz w bazie - nie zaciągam
                    /*
                    Base.execSQL(con, "update Pracownicy set " +
                        " where Id = " + pracId);

                    ImportRODZINA(conKP, con, NR_EW, pracId, false);
                    ImportUMOWY(conKP, con, NR_EW, pracId, false);  // i aneksy
                    ImportSZKOLY(conKP, con, NR_EW, pracId);
                    ImportSTAZPRACY(conKP, con, NR_EW, pracId);
                    */
                }
                pc.Progress++;
            }
            pc.Progress = pc.Max;   // dla pewnosci
            return cnt;
        }

        //-------------------------------------------------------------------------
        // umowa jest jedna do pracownika ... 

        public static void ImportUMOWY(OdbcConnection conKP, SqlConnection con, string NR_EW, string pracId, bool fNew, App.ProcessClass pc)
        {
            DataSet ds = Base.getDataSet(conKP, "select * from PRACA where NR_EW = " + NR_EW);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string umId = Base.getScalar(con, "select Id from Umowy where IdPracownika = " + pracId + " and OkresOd = " + Base.strParam(Base.DateToStr(dr["PRZYJ_DN"])));
                if (String.IsNullOrEmpty(umId))
                {
                    int id = Base.insertSQL(con, "insert into Umowy (" +
                        "IdPracownika,Data,Typ,OkresOd,OkresDo,EtatL,EtatM,Stawka,Stanowisko" +
                        ") values (" +
                            Base.insertParam(pracId) +
                            Base.insertParam(Base.NULL) +
                            Base.insertStrParam(dr, "TYP_UMOWY") +
                            Base.insertDateParamYYYYMMDD(dr, "PRZYJ_DN") +
                            Base.insertDateParamYYYYMMDD(dr, "DO_KIEDY") +  // <<<< spr bo moze byc null albo 0 !!!
                            Base.insertParam(dr, "ETATL") +
                            Base.insertParam(dr, "ETATM") +
                            Base.insertFloatParam(dr, "STAWKA") +
                            Base.insertStrParamLast(dr, "STANOW") +
                        ")", pc.user);
                    if (id == -1) // <<<<, obsłużyć jak nie doda !!!
                    {
                        string data = Base.DateToStr(dr["PRZYJ_DN"]);
                        Log.Error(pc.user, Log.t2APP_IMPORTKP, NR_EW + " PracId:" + pracId + " Data:" + data, "ImportUMOWY");
                    }
                    else
                    {
                        umId = id.ToString();
                        ImportANEKSY(conKP, con, NR_EW, pracId, umId, true, pc);
                    }
                }
                else
                {
                    /*
                    Base.execSQL(con, "update Pracownicy set " +
                        " where Id = " + pracId);
                     */

                    //ImportANEKSY(conKP, con, NR_EW, pracId, umId, false);
                }

            }
        }
        //--------------------------------
        public static void ImportANEKSY(OdbcConnection conKP, SqlConnection con, string NR_EW, string pracId, string umId, bool fNew, App.ProcessClass pc)
        {
            DataSet ds = Base.getDataSet(conKP, "select * from AWANSE where NR_EW = " + NR_EW);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                //string Data = Base.strParam(Base.getValue(dr, "AWANS_DN"));
                string Data = Base.strParam(Base.DateToStr(dr["AWANS_DN"]));
                string isData = Base.getScalar(con, "select IdUmowy from Aneksy where IdUmowy = " + umId + " and Data = " + Data);
                if (String.IsNullOrEmpty(isData))
                {
                    int id = Base.insertSQL(con, "insert into Aneksy (" +
                        "IdUmowy,Data,EtatL,EtatM,Stawka,Stanowisko" +
                        ") values (" +
                            Base.insertParam(umId) +
                            Base.insertParam(Data) +
                            Base.insertParam(dr, "ETATL") +
                            Base.insertParam(dr, "ETATM") +
                            Base.insertFloatParam(dr, "STAWKA") +
                            Base.insertStrParamLast(dr, "STANOW") +
                        ")");
                    if (id == -1) // <<<<, obsłużyć jak nie doda !!!
                    {
                        Log.Error(pc.user, Log.t2APP_IMPORTKP, NR_EW + " PracId:" + pracId + " UmowaId:" + umId + " aneks:" + Data, "ImportANEKSY");
                    }
                }
                else
                { }
            }
        }

        //--------------------------------
        public static void ImportSZKOLY(OdbcConnection conKP, SqlConnection con, string NR_EW, string pracId, App.ProcessClass pc)
        {
            DataSet ds = Base.getDataSet(conKP, "select * from SZKOLA where NR_EW = " + NR_EW);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string isData = Base.getScalar(con, "select IdPracownika from Szkoly where IdPracownika = " + pracId);  // założenie relacja 1:1 !!!
                if (String.IsNullOrEmpty(isData))
                {
                    string wykszt = Base.getValue(dr, "WYKSZT");
                    string szkola = getValuePL(dr, "NAZWASZK");
                    int id = Base.insertSQL(con, "insert into Szkoly (" +
                        "IdPracownika,DataUkonczenia,Nazwa" +
                        ") values (" +
                            Base.insertParam(pracId) +
                            Base.insertDateParamYYYYMMDD(dr, "DATA_UK") +
                        //insertStrParamLastPL(dr, "NAZWASZK") +
                            Base.insertStrParamLast(szkola) +
                        //Base.insertStrParamLast(wykszt) +
                        ")");
                    if (id == -1) // <<<<, obsłużyć jak nie doda !!!
                    {
                        Log.Error(pc.user, Log.t2APP_IMPORTKP, NR_EW + " PracId:" + pracId + " szkoła:" + szkola, "ImportSZKOLY");
                    }
                    Base.execSQL(con, "update Pracownicy set " +   // zawsze aktualizuje
                        Base.updateStrParamLast("WYKSZT", wykszt) +
                        "where Id = " + pracId);
                }
                else
                { }
            }
        }
        //--------------------------------
        public static void ImportSTAZPRACY(OdbcConnection conKP, SqlConnection con, string NR_EW, string pracId, App.ProcessClass pc)
        {
            DataSet ds = Base.getDataSet(conKP, "select * from HISTORIA where NR_EW = " + NR_EW);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string DataOd = Base.strParam(Base.DateToStr(dr["DATA_OD"]));
                string DataDo = Base.strParam(Base.DateToStr(dr["DATA_DO"]));
                string isData = Base.getScalar(con, "select IdPracownika from StazPracy where IdPracownika = " + pracId + " and OkresZOd = " + DataOd + " and OkresZDo = " + DataDo);   // tu trzeba pokazać/zmodyfikować rekordy które już istnieją, a zmieniła im się tylko data !!!
                if (String.IsNullOrEmpty(isData))
                {
                    string zaklad = getValuePL(dr, "ZAKLAD");
                    int id = Base.insertSQL(con, "insert into StazPracy (" +
                        "IdPracownika,NazwaZakladu,OkresZOd,OkresZDo" +
                        ") values (" +
                            Base.insertParam(pracId) +
                            Base.insertStrParam(zaklad) +
                            Base.insertParam(DataOd) +
                            Base.insertParamLast(DataDo) +
                        ")");
                    if (id == -1) // <<<<, obsłużyć jak nie doda !!!
                    {
                        Log.Error(pc.user, Log.t2APP_IMPORTKP, NR_EW + " PracId:" + pracId + " zakład:" + zaklad, "ImportSTAZPRACY");
                    }
                }
                else
                { }
            }
        }
        //--------------------------------
        public static void ImportRODZINA(OdbcConnection conKP, SqlConnection con, string NR_EW, string pracId, bool fNew, App.ProcessClass pc)
        {
            DataSet ds = Base.getDataSet(conKP, "select * from RODZINA where NR_EW = " + NR_EW);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string Imie = Base.strParam(getValuePL(dr, "IMIE"));
                string Nazwisko = Base.strParam(getValuePL(dr, "NAZWISKO"));
                string DataUr = Base.strParam(Base.DateToStr(dr["DATA_UR"]));
                string krewny = Base.getValue(dr, "KREWNY");
                switch (krewny)
                {
                    case "11":     // dziecko
                        string isData = Base.getScalar(con,
                            "select IdPracownika from Rodzina where IdPracownika = " + pracId +
                            " and Imie = " + Imie +
                            " and Nazwisko = " + Nazwisko +
                            " and DataUrodzenia = " + DataUr);
                        if (String.IsNullOrEmpty(isData))
                        {
                            int id = Base.insertSQL(con, "insert into Rodzina (" +
                                "IdPracownika,Imie,Nazwisko,DataUrodzenia,PESEL" +
                                ") values (" +
                                    Base.insertParam(pracId) +
                                    Base.insertParam(Imie) +
                                    Base.insertParam(Nazwisko) +
                                    Base.insertParam(DataUr) +
                                    Base.insertStrParamLast(dr, "PESEL") +
                                ")");
                            if (id == -1) // <<<<, obsłużyć jak nie doda !!!
                            {
                                Log.Error(pc.user, Log.t2APP_IMPORTKP, NR_EW + " PracId:" + pracId + " Dziecko:" + Imie + " " + Nazwisko, "ImportRODZINA");
                            }
                        }
                        else
                        { }
                        break;
                    case "01":      // współmałżonek
                        if (fNew)
                            Base.execSQL(con, "update Pracownicy set " +
                                    Base.updateParam("IMIE_WSPM", Imie) +
                                    Base.updateParam("NAZW_WSPM", Nazwisko) +
                                    Base.updateStrParamLast("PESEL_WSPM", Base.getValue(dr, "PESEL")) +
                                "where Id = " + pracId);
                        break;
                }
            }
        }
        //--------------------------------
        private static void importSlownik(OdbcConnection conKP, SqlConnection con, string sql, string typ)
        {
            DataSet ds = Base.getDataSet(conKP, sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string Kod = Base.strParam(Base.getValue(dr, 0));
                string Nazwa = Base.strParam(getValuePL(dr, 1));
                string Opis = Base.strParam(getValuePL(dr, 2));

                string id = Base.getScalar(con,
                    "select Id from Slowniki where Typ = " + Base.strParam(typ) + " and Kod = " + Kod);
                if (String.IsNullOrEmpty(id))
                    Base.execSQL(con, "insert into Slowniki (" +
                        "Typ, Kod, Nazwa, Opis" +
                        ") values (" +
                            Base.insertStrParam(typ) +
                            Base.insertParam(Kod) +
                            Base.insertParam(Nazwa) +
                            Base.insertParamLast(Opis) +
                        ")");
                else    // wypadałoby wyróżnić te pozycje, które zostały usunięte - przez dodanie pola status, na razie nie robię
                    Base.execSQL(con, "update Slowniki set " +
                            Base.updateParam("Nazwa", Nazwa) +
                            Base.updateParamLast("Opis", Opis) +
                        "where Id = " + id);
            }
        }

        public static void ImportSLOWNIKI(OdbcConnection conKP, SqlConnection con)
        {
            importSlownik(conKP, con, "select KOD, NAZWA, null from WYKSZT", "WYKSZT");
            importSlownik(conKP, con, "select STATUS, NAZWA, null from STATUS", "STATUS");  // status umowy
            importSlownik(conKP, con, "select KOD, NAZWA, null from TYPUMOWY", "TYPUM");
            importSlownik(conKP, con, "select KOD, NAZWA, null from STANOW", "STANOW");
        }










        //----- export do PRP -------------------------------------------------------
        public static int ImportKP(OdbcConnection conKP, SqlConnection con)
        {
            int cnt = 0;
            Base.execSQL(con, "delete from KP");
            DataSet ds = Base.getDataSet(conKP,
                "select K.NR_EW, K.NAZWISKO, K.IMIE, K.STATUS, " + 
                    "P.PRZYJ_DN, P.TYP_UMOWY, P.DO_KIEDY, P.RODZ_PRAC, P.DATA_ZWOL, S.NAZWA, S.TYP, S.OPIS " +
                "from KADRY K " +
                "left outer join PRACA P on P.NR_EW = K.NR_EW " +
                "left outer join STANOW S on S.KOD = P.STANOW");

            try
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string nr_ew = Base.getValue(dr, "NR_EW");
                    string NR_EW = Base.strParam(nr_ew);
                    string nazwisko = PrepareNazwisko(getValuePL(dr, "NAZWISKO"));
                    string imie = PrepareNazwisko(getValuePL(dr, "IMIE"));

                    /*
                    object o1 = dr["PRZYJ_DN"];
                    object o2 = dr["DO_KIEDY"];
                    object o3 = dr["DATA_ZWOL"];

                    DateTime? dt1 = Base.getDateTime(dr, "PRZYJ_DN");
                    DateTime? dt2 = Base.getDateTime(dr, "DO_KIEDY");
                    DateTime? dt3 = Base.getDateTime(dr, "DATA_ZWOL");

                    string d1 = Base.DateToStr(dr["PRZYJ_DN"]);
                    string d2 = Base.DateToStr(dr["DO_KIEDY"]);
                    string d3 = Base.DateToStr(dr["DATA_ZWOL"]);
                    */

                    string sql = Base.insertSql("KP", 0, "NR_EW,Nazwisko,Imie,Status,Stanowisko,TypStanowiska,OpisStanowiska,PRZYJ_DN,TYP_UMOWY,DO_KIEDY,RODZ_PRAC,DATA_ZWOL",
                        NR_EW,
                        Base.strParam(nazwisko),
                        Base.strParam(imie),
                        Base.strParam(Base.getValue(dr, "STATUS")),
                        Base.strParam(pl(Base.getValue(dr, "NAZWA"))),
                        Base.strParam(pl(Base.getValue(dr, "TYP"))),
                        Base.strParam(pl(Base.getValue(dr, "OPIS"))),

                        /*
                        Base.strParam(Base.getValue(dr, "PRZYJ_DN")),
                        Base.strParam(Base.getValue(dr, "TYP_UMOWY")),
                        Base.strParam(Base.getValue(dr, "DO_KIEDY")),
                        Base.strParam(Base.getValue(dr, "RODZ_PRAC")),
                        Base.strParam(Base.getValue(dr, "DATA_ZWOL"))
                        */

                        Base.nullStrParam(Base.DateToStr(dr["PRZYJ_DN"])),
                        Base.strParam(Base.getValue(dr, "TYP_UMOWY")),
                        Base.nullStrParam(Base.DateToStr(dr["DO_KIEDY"])),
                        Base.strParam(Base.getValue(dr, "RODZ_PRAC")),
                        Base.nullStrParam(Base.DateToStr(dr["DATA_ZWOL"])));
                    
                    bool ok = Base.insertSQL2(con, sql);
                    if (!ok)
                    {
                        Log.Error(Log.t2APP, "ImportKP", "Nie można dodać rekordu - Pracownik: " + NR_EW, Log.OK);
                        cnt = -1;
                        break;
                    }
                    cnt++;
                }
            }
            catch (Exception ex)
            {
                Log.Error(Log.t2APP, "ImportKP", ex.Message, Log.OK);
                cnt = -1;
            }
            return cnt;
        }

        public static int ImportKP()
        {
            int err = -1;
            try
            {
                SqlConnection con = Base.Connect();
                OdbcConnection conKP = Base.odbcConnect(conStrKP);
                err = ImportKP(conKP, con);
                Base.Disconnect(conKP);
                Base.Disconnect(con);
            }
            catch (Exception ex)
            {
                Log.Error(Log.t2APP, "ImportKP", ex.Message, Log.OK);
                err = -1;
            }
            Log.Info(Log.t2APP, "ImportKP - KONIEC", String.Format("Error: {0}", err), Log.OK);
            return err;
        }
        //--------------




        //----- działy -----
        /*
        Base.execSQL(conPRP, String.Format(
                "delete from {0};" +
                "set identity_insert {0} ON;" +
                "insert into {0} ({1}) select {3} from {2};" +
                "insert into {0} ({1}) select {5} from {4};" +
                "set identity_insert {0} OFF;",
                "Stanowiska", "Id,IdDzialu,Stanowisko",
                "HR_DB.dbo.Dzialy", "Id,0,Nazwa",
                "HR_DB.dbo.Stanowiska", "Id,IdDzialu,Nazwa"
                ));
        */

        /*
        ds = Base.getDataSet(con, "select * from Dzialy where Status >= 0");
        foreach (DataRow dr in Base.getRows(ds))
        {
            string dzial = Base.getValue(dr, "Nazwa");
            string did = Base.getValue(dr, "Id");
            DataRow drP = Base.getDataRow(conPRP, "select * from Stanowiska where IdDzialu = 0 and Stanowisko = " + dzial);
            if (drP == null)
            {
                int id = Base.insertSQL(conPRP, Base.insertSql("Stanowiska", 0,
                    "IdDzialu, Stanowisko, Status",
                    0, dzial, 1));
            }
            else
            {
                bool ok = Base.execSQL(conPRP, Base.updateSql("Stanowiska", 0,
                    "Status", "Id = " + did,
                    0));
            }
        }
        //----- stanowiska -----
        ds = Base.getDataSet(con, "select S.Id, S.IdDzialu, S.Nazwa as Stanowisko, D.Nazwa as Dzial from Stanowiska S " +
            "left outer join Dzialy D on D.Id = S.IdDzialu");
        foreach (DataRow dr in Base.getRows(ds))
        {
            string stan = Base.getValue(dr, "Stanowisko");
            string dzial = Base.getValue(dr, "Dzial");
            string sid = Base.getValue(dr, "Id");
            DataRow drP = Base.getDataRow(conPRP, "select * from Stanowiska where IdDzialu <> 0 and Stanowisko = " + stan);
            string did = Base.getScalar(conPRP, "select Id from Stanowiska where IdDzialu = 0 and Stanowisko = " + dzial);
            if (drP == null)
            {
                int id = Base.insertSQL(conPRP, Base.insertSql("Stanowiska", 0,
                    "IdDzialu, Stanowisko, Status",
                    did, stan, 1));
            }
            else
            {
                bool ok = Base.execSQL(conPRP, Base.updateSql("Stanowiska", 0,
                    "IdDzialu, Status", "Id = " + sid,
                    0));
            }
        }
        */

        private static void ImportDzialStanowisko(SqlConnection conPRP, string dzial, string stanowisko, out string dId, out string sId)
        {
            if (String.IsNullOrEmpty(dzial) || String.IsNullOrEmpty(dzial))
            {
                dId = null;
                sId = null;
            }
            else
            {
                //----- dzial -----
                dId = Base.getScalar(conPRP, String.Format(
                    "select Id from Stanowiska where IdDzialu = 0 and Stanowisko = '{0}'", dzial));
                if (String.IsNullOrEmpty(dId))
                {
                    int id = Base.insertSQL(conPRP, Base.insertSql("Stanowiska", 0,
                        "IdDzialu,Stanowisko,Status",
                        0, Base.strParam(dzial), 1  // nowy
                        ));
                    dId = id.ToString();
                    sId = null; // nowy dział - wszystkie stanowiska nowe
                }
                else            // stary dział - spr stanowisko
                {
                    Base.execSQL(conPRP, "update Stanowiska set Status = 0 where Id = " + dId);
                    sId = Base.getScalar(conPRP, String.Format(
                        "select Id from Stanowiska where IdDzialu = {0} and Stanowisko = '{1}'", dId, stanowisko));
                }
                //----- stanowisko -----
                if (String.IsNullOrEmpty(sId))
                {
                    int id = Base.insertSQL(conPRP, Base.insertSql("Stanowiska", 0,
                        "IdDzialu,Stanowisko,Status",
                        dId, Base.strParam(stanowisko), 1  // nowe
                        ));
                    sId = id.ToString();
                }
                else
                {
                    Base.execSQL(conPRP, "update Stanowiska set Status = 0 where Id = " + sId);
                }
            }
        }
        
        public static int ExportToPRP(SqlConnection con, SqlConnection conPRP)
        {
            int cnt = 0;

            //----- wzięte na sztywno z tabeli -----
            const int tDL = 1;
            const int tSKier = 2;
            const int tIL_SGaA = 3;
            const int tBKier = 4;

            //Base.execSQL(conPRP, "update Pracownicy set Status = -1, IdDzialu = -IdDzialu, IdStanowiska = -IdStanowiska");  // status - stary
            Base.execSQL(conPRP, "update Pracownicy set Status = -1");  // status - stary
            Base.execSQL(conPRP, "update Stanowiska set Status = -1");  // status - stary

            DataSet ds = Base.getDataSet(con, "select " +
                    "P.Id, P.Imie, P.Nazwisko, P.KadryId, P.Opis, P.Login, P.Email, P.Mailing, " +
                    "K.Id, K.Imie, K.Nazwisko, K.KadryId, " +
                    "P.IdDzialu, D.Nazwa as Dzial, P.IdStanowiska, S.Nazwa as Stanowisko, " +
                    "P.IdKierownika, P.IdProjektu, " +
                    "P.Admin, P.Kierownik, P.Raporty, P.Status, " +
                    "P.DataZatr, P.Info " +
                "FROM Pracownicy P " +
                    "left outer join Pracownicy K on K.Id = P.IdKierownika " +
                    "left outer join Dzialy D on D.Id = P.IdDzialu " +
                    "left outer join Stanowiska S on S.Id = P.IdStanowiska " +
                "where P.Status >= 0");   // wszyscy pracujący i nie pomijani

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string dzial = Base.getValue(dr, "Dzial");
                string stanowisko = Base.getValue(dr, "Stanowisko");
                string dId, sId;
                ImportDzialStanowisko(conPRP, dzial, stanowisko, out dId, out sId); 

                string kadryId = Base.getValue(dr, "KadryId");
                if (!String.IsNullOrEmpty(kadryId))     // jak null to nie dodaję, zakładam, ze to nowy pracownik
                {
                    bool kier = Base.getBool(dr, "Kierownik", false);
                    string login = Base.getValue(dr, "Login");
                    string email = Base.getValue(dr, "Email");
                    if (String.IsNullOrEmpty(login)) login = "login_" + kadryId;
                    if (String.IsNullOrEmpty(email)) email = "email_" + kadryId;
                    // szukam pracownika po KadryId
                    DataRow drP = Base.getDataRow(conPRP, "select * from Pracownicy where KadryId = " + Base.strParam(kadryId));
                    if (drP == null)        // nie znalazł - nowy pracownik
                    {
                        int id = Base.insertSQL(conPRP, Base.insertSql("Pracownicy", 0,
                            "Login, Imie, Nazwisko, Opis, Email, Mailing, DataZatrudnienia, DataUmowy, IdDzialu, IdStanowiska, IdKierownika, " +
                            "IdZastepstwa, CzasZastepstwa, Oceniany, Administrator, Kierownik, KadryId, Status, IdTypu",
                            Base.nullStrParam(login),
                            Base.nullStrParam(Base.getValue(dr, "Imie")),
                            Base.nullStrParam(Base.getValue(dr, "Nazwisko")),
                            Base.nullStrParam(Base.getValue(dr, "Opis")),
                            Base.nullStrParam(email),
                            1,  // mailing
                            Base.nullStrParam(Base.getValue(dr, "DataZatr")),
                            Base.NULL,
                            Base.nullParam(dId),    // dzial 
                            Base.nullParam(sId),    // stanowisko
                            Base.nullParam(Base.getValue(dr, "IdKierownika")),
                            Base.NULL,
                            Base.NULL,
                            1,                      // oceniany
                            0,                      // administrator
                            kier ? 1 : 0,           // kierownik
                            Base.strParam(kadryId),
                            1,                      // status - nowy
                            kier ? tSKier : tDL
                            ));
                    }
                    else
                    {
                        bool oceniany = Base.getBool(drP, "Oceniany", false);
                        string loginP = Base.getValue(drP, "Login");
                        string emailP = Base.getValue(drP, "Email");
                        if (!oceniany)          // jak był oceniany to maile i login ma poprawne - nie zmieniam !!!
                        {
                            if (String.IsNullOrEmpty(loginP) || loginP.StartsWith("login"))
                                loginP = login;
                            if (String.IsNullOrEmpty(emailP) || emailP.StartsWith("email"))
                                emailP = email;
                        }
                        bool ok = Base.execSQL(conPRP, Base.updateSql("Pracownicy", 0,
                            //IdPracownika, Opis
                            "Login, Imie, Nazwisko, Email, DataZatrudnienia, " +
                            "IdDzialu, IdStanowiska, " +
                            "IdKierownika, Kierownik, Status, IdTypu",
                            "KadryId = " + kadryId,
                            Base.nullStrParam(loginP),
                            Base.nullStrParam(Base.getValue(dr, "Imie")),
                            Base.nullStrParam(Base.getValue(dr, "Nazwisko")),
                            Base.nullStrParam(emailP),
                            Base.nullStrParam(Base.getValue(dr, "DataZatr")),
                            Base.nullParam(dId),
                            Base.nullParam(sId),
                            Base.nullParam(Base.getValue(dr, "IdKierownika")),
                            kier ? 1 : 0,           // kierownik
                            0,                      // status - istniejący
                            kier ? tSKier : tDL
                            ));
                    }
                    cnt++;
                }
            }
            //----- kierownicy ----- 
            Base.execSQL(conPRP, "update Pracownicy set Pracownicy.IdKierownika = K.IdPracownika " +
                "from Pracownicy " +
                "left outer join HR_DB.dbo.Pracownicy R on R.Id = Pracownicy.IdKierownika " +
                "left outer join Pracownicy K on K.KadryId = R.KadryId " +
                "where Pracownicy.Status >= 0 and Pracownicy.IdKierownika is not null and Pracownicy.IdKierownika <> 0");
            //----- loginy i maile z AD i PWD ----- 
            //----- update znacznika kierownik -----
            //----- update typ - wszyscy na tDL, kierownicy na tSKier -----
            //----- update typ - wg działu HR, IT -----
            //----- loginy i maile z AD i PWD ----- 

            //----- update typ - wszyscy na tDL, kierownicy na tSKier -----
            Base.execSQL(conPRP, String.Format("update Pracownicy set IdTypu={0}", tDL));
            //----- update znacznika kierownik -----
            //Base.execSQL(conPRP, "update Pracownicy set Kierownik=0 where IdPracownika not in (select distinct IdKierownika from Pracownicy where IdKierownika is not null and Status >= 0)");
            Base.execSQL(conPRP, "update Pracownicy set Kierownik=0");
            Base.execSQL(conPRP, "update Pracownicy set Kierownik=1,IdTypu=" + tSKier.ToString() + " where IdPracownika in (select distinct IdKierownika from Pracownicy where IdKierownika is not null and Status >= 0)");
            //----- update typ - wg działu HR, IT -----
            Base.execSQL(conPRP, "update Pracownicy set IdTypu=" + tIL_SGaA.ToString() + " where IdDzialu in (" +
                        "select Id from Stanowiska where Stanowisko in ('HR','IT','Finance')" +
                    ")");
            //----- old stanowiska -----
            Base.execSQL(conPRP, "update Stanowiska set Stanowisko = '* ' + Stanowisko where Status = -1 and LEFT(Stanowisko,1) <> '*'");
            return cnt;
        }

        public static int ExportToPRP()
        {
            const string info = "Eksport danych do PRP";
            const string error = " - BŁĄD";

            Log.Info(Log.t2APP, info, null, Log.OK);
            string conStr = ConfigurationManager.ConnectionStrings["PRPConnectionString"].ConnectionString;
            int err = -1;
            try
            {
                SqlConnection con = Base.Connect();
                SqlConnection conPRP = Base.Connect(conStr);


                //err = AD.ImportAD(con);
                err = 0;



                if (err < 0)
                    Log.Error(Log.t2APP, info + error + " ImportAD", String.Format("Error: {0}", err), Log.OK);
                else
                {
                    err = ExportToPRP(con, conPRP);
                    if (err > 0) err = 0;
                }
                Base.Disconnect(conPRP);
                Base.Disconnect(con);
            }
            catch (Exception ex)
            {
                Log.Error(Log.t2APP, info + error, ex.Message, Log.OK);
                err = -1;
            }
            Log.Info(Log.t2APP, info + " - KONIEC", String.Format("Error: {0}", err), Log.OK);
            return err;
        }
    }
}
