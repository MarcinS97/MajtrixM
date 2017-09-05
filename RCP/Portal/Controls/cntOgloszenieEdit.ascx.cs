﻿using AjaxControlToolkit;
using HRRcp.App_Code;
using Portal.Controls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRRcp.Portal.Controls
{
    public partial class cntOgloszenieEdit : System.Web.UI.UserControl
    {
        public event EventHandler Save;
        public event EventHandler Regulamin;

        const string poOgloszenia = "poOgloszenia";  // tabela

        const string imgAllowed = "png,jpg,jpeg,gif";       // <<< do ustawień

        const string errDelete = "Wystąpił błąd podczas usuwania ogłoszenia.";
        const string errSave = "Wystąpił błąd podczas zapisywania ogłoszenia.";
        const string errUpload = "Wystąpił błąd podczas ładowania pliku.";
        const string errFileSize = "Zbyt duży rozmiar pliku. Dopuszczalny rozmiar to {0}MB";
        const string errFileFormat = "Niepoprawny format pliku. Dozwolone formaty to {0}.";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Tools.MakeConfirmDeleteRecordButton(modalDelete);
                Tools.MakeConfirmButton(btImageDelete, "Potwierdź usunięcie zdjęcia.");
                ltZalacz.Text = String.Format(ltZalacz.Text, PortalUstawienia.maxFileSizeMB);
            }
            else
            {
                UpdateImage();   // jeżeli jest ustawione z js, to znika przy postback
                Tools.ExecOnStart2("dpick", String.Format("prepareCalendar2('{0}');", "cntOgloszenia"));
            }
        }

        private void UpdateImage()
        {
            string img = hidImage.Value;
            if (!String.IsNullOrEmpty(img))
            {
                if (img != cntOgloszenia.GetThumbFileName(Image1.ImageUrl))   // tylko jak się różni żeby nie migało niepotrzebnie
                    Image1.ImageUrl = cntOgloszenia.GetThumbUrlNoCache(img);
                JsShow(btImageDelete.ClientID, true);
            }
            else
            {
                string err = hidImageErrorMsg.Value;
                if (!String.IsNullOrEmpty(err))
                    lbImageError.Text = err;
            }
        }




        //----- EDIT FORM -----
        public void Show(cntOgloszenia ogl, string oid, bool resend)
        {
            OgloszenieId = oid;
            bool wyst = cntOgloszenia.IsWystawiajacy && !cntOgloszenia.IsZablokowany;
            if (wyst && ValidateCount(App.User.Id))     // na wejście sprawdzam czy można wystawić
            {
                bool adm = cntOgloszenia.IsAdmin;
                bool create = String.IsNullOrEmpty(oid);
                lbTitleNowe.Visible = create;
                lbTitleEdycja.Visible = !create && !resend;
                lbTitleResend.Visible = !create && resend;
                Resend = resend;
                FillData(ogl, oid, resend);
                modalDelete.Visible = adm && !create;
                cbRegAcc.Checked = !create && !resend;      // skoro zapisał, to musiał zaznaczyć <<< później dać to do bazy
                modalSave.Enabled = !create && !resend;      // tylko jak w create i nie wystawia ponownie
                modalSave.Text = create || resend ? "Wystaw" : "Zapisz";
                DeleteImageFileName = null;

                Tools.FixMultiLineMaxLen(tbTresc);
                hidImageErrorMsg.Value = null;
                lbImageError.Text = null;
                //ImageShowError(null);

                modalOgloszenie.Show(false);        // sam czyszczę, bo są poinicjowane pola
                //Tools.ExecOnStart2("dpick", String.Format("prepareCalendar('{0}');", "cntOgloszenia"));
            }
        }

        private DataRow FillData(cntOgloszenia ogl, string oid, bool resend)
        {
            if (ddlModalKategoria.Items.Count == 0)
                ddlModalKategoria.DataBind();

            if (String.IsNullOrEmpty(oid))
            {
                //----- nowe -----
                Tools.SelectItem(ddlModalKategoria, ogl.KategoriaFilter);    // na podstwie filtra
                tbTresc.Text = null;
                hidImage.Value = null;
                Image1.ImageUrl = null;

                //btImageDelete.Visible = false;
                JsShow(btImageDelete.ClientID, false);

                DateTime dt = DateTime.Today.AddDays(PortalUstawienia.maxDni - 1);        // na koniec okresu 
                //tbDataZakonczenia.Text = Tools.DateToStr(dt);
                deDataZakonczenia.Date = dt;
                return null;
            }
            else
            {
                //----- edycja -----
                DataRow dr = db.getDataRow(db.conP, String.Format(dsOgloszenie.SelectCommand, oid));
                if (dr != null)
                {
                    string id = db.getValue(dr, "Id");
                    string kat = db.getValue(dr, "IdKategoria");
                    string status = db.getValue(dr, "Status");
                    string zdjecie = db.getValue(dr, "Zdjecie");
                    tbTresc.Text = db.getValue(dr, "Tresc");

                    if (resend)
                    {
                        DateTime dt = DateTime.Today.AddDays(PortalUstawienia.maxDni - 1);        // na koniec okresu 
                        //tbDataZakonczenia.Text = Tools.DateToStr(dt);
                        deDataZakonczenia.Date = dt;
                    }
                    else
                    {
                        //tbDataZakonczenia.Text = db.getValue(dr, "DataZakonczeniaStr");
                        deDataZakonczenia.DateStr = db.getValue(dr, "DataZakonczeniaStr");
                    }

                    hidImage.Value = zdjecie;
                    bool img = !String.IsNullOrEmpty(zdjecie);
                    Tools.SelectItem(ddlModalKategoria, kat);
                    Image1.ImageUrl = img ? cntOgloszenia.GetThumbUrlNoCache(zdjecie) : null;

                    //btImageDelete.Visible = img;
                    JsShow(btImageDelete.ClientID, img);

                }
                return dr;
            }
        }

        //protected void modalAccept_Click(object sender, EventArgs e)
        //{
        //}

        //protected void modalReject_Click(object sender, EventArgs e)
        //{
        //}

        private void JsShow(string id, bool visible)
        {
            Tools.ExecOnStart2("jsshow", String.Format(visible ? "$('#{0}').show();" : "$('#{0}').hide();", id));
        }

        private bool ImageDelete()
        {
            string zdjecie = DeleteImageFileName;
            string path = MapImagesPath;
            string pn1 = path + zdjecie;
            string pn2 = path + cntOgloszenia.thumb + zdjecie;
            try
            {
                File.Delete(pn1);
                File.Delete(pn2);
                return true;
            }
            catch
            {
                Tools.ShowError("Wystąpił błąd podczas usuwania pliku zdjęcia.");
                return false;
            }
        }

        protected void btImageDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DeleteImageFileName = hidImage.Value;
                hidImage.Value = null;
                Image1.ImageUrl = null;
                //btImageDelete.Visible = false;
                JsShow(btImageDelete.ClientID, false);
            }
            catch
            {
                Tools.ShowError("Wystąpił błąd podczas usuwania pliku zdjęcia.");
            }
        }

        private void TriggerSave()
        {
            if (Save != null)
                Save(this, EventArgs.Empty);
        }

        protected void modalDelete_Click(object sender, EventArgs e)
        {
            if (Remove(OgloszenieId))
            {
                modalOgloszenie.Close();
                TriggerSave();
                //lvOgloszenia.DataBind();
            }
        }

        protected void modalSave_Click(object sender, EventArgs e)
        {
            if (SaveData(OgloszenieId))
            {
                modalOgloszenie.Close();
                TriggerSave();
                //lvOgloszenia.DataBind();
                //TriggerRefresh(refSave);
            }
        }
        //-----------------
        private bool ValidateDate(string data, out string dtstr)
        {
            DateTime? dt = Tools.StrToDateTime(data);
            if (dt == null) Tools.ShowError("Niepoprawny format daty zakończenia publikacji.");
            else
            {
                DateTime maxdt = DateTime.Today.AddDays(PortalUstawienia.maxDni);
                if ((DateTime)dt >= maxdt) Tools.ShowError(String.Format("Data zakończenia publikacji ogłoszenie nie może być większa niż {0}", Tools.DateToStr(maxdt)));
                else if ((DateTime)dt < DateTime.Today) Tools.ShowError("Data zakończenia publikacji wcześniejsza od dzisiejszej.");
                else
                {
                    dtstr = Tools.DateToStrDb((DateTime)dt);
                    return true;
                }
            }
            dtstr = null;
            return false;
        }

        private bool ValidateCount(string pracId)
        {
            DataRow dr = db.getDataRow(db.conP, String.Format(dsCheck.SelectCommand, pracId));
            int cnt = db.getInt(dr, 0, 0);
            bool ok = cnt < PortalUstawienia.maxOgloszenia;
            if (!ok)
                Tools.ShowError("Wystawienie niemożliwe.\nPrzekroczono dozwoloną ilość ogłoszeń wystawionych w jednym czasie ({0}).", PortalUstawienia.maxOgloszenia);
            return ok;
        }

        private bool Validate(out string datado)
        {
            datado = null;
            if (ValidateCount(App.User.Id))
                if (String.IsNullOrEmpty(ddlModalKategoria.SelectedValue))
                    Tools.ShowError("Wybierz kategorię.");
                else
                    if (String.IsNullOrEmpty(tbTresc.Text))
                        Tools.ShowError("Podaj treść ogłoszenia.");
                    else
                        if (ValidateDate(deDataZakonczenia.DateStr, out datado))
                            return true;
            return false;
        }

        private bool SaveData(string id)
        {
            bool ok = false;
            string text = Tools.RemoveHtmlTags(tbTresc.Text);
            string kat = ddlModalKategoria.SelectedValue;
            string zdjecie = hidImage.Value;
            if (zdjecie == "") zdjecie = null;
            string datado;
            string oid;
            if (Validate(out datado))
            {
                //string text = HttpUtility.HtmlDecode(Tools.RemoveHtmlTags(html));
                if (String.IsNullOrEmpty(id))
                {
                    ok = db.insert(db.conP, out oid, poOgloszenia, "IdPracownika,IdKategoria,Tresc,Zdjecie,DataZakonczenia,Status"
                        , App.User.Id
                        , kat
                        , text
                        , zdjecie
                        , datado
                        , cntOgloszenia.stOczekujace
                        );
                    if (ok)
                        OgloszenieId = oid;   //zeby dalej tylko modyfikował
                }
                else
                {
                    oid = id;
                    ok = db.update(db.conP, poOgloszenia, "Id=" + id, "IdKategoria,Tresc,Zdjecie,DataZakonczenia" + (Resend ? ",Status" : "")
                        , kat
                        , text
                        , zdjecie
                        , datado
                        , cntOgloszenia.stOczekujace  // musi byc na koncu!!!
                        );
                }
                if (ok)
                    if (!String.IsNullOrEmpty(zdjecie))
                        ok = PrepareZdjecieOnUpdate(oid);
                    else if (!String.IsNullOrEmpty(DeleteImageFileName))
                        ok = ImageDelete();
                if (!ok) Tools.ShowError(errSave);
            }
            return ok;
        }

        public static bool Remove(string id)
        {
            bool ok = db.delete(db.conP, poOgloszenia, "Id=" + id);
            if (!ok) Tools.ShowError(errDelete);
            return ok;
        }

        private bool PrepareZdjecieOnUpdate(string oid)
        {
            string zdjecieS = hidImage.Value;
            string ext = Path.GetExtension(zdjecieS);
            string zdjecieD = oid + ext;

            if (zdjecieS != zdjecieD)
            {
                string path = MapImagesPath;
                string pn1S = path + zdjecieS;
                string pn2S = path + cntOgloszenia.thumb + zdjecieS;
                string pn1D = path + zdjecieD;
                string pn2D = path + cntOgloszenia.thumb + zdjecieD;

                bool ok = false;
                int step = 0;
                try
                {
                    //step = 1; File.Delete(pn1D);
                    step = 2; File.Copy(pn1S, pn1D, true);
                    try
                    {
                        step = 3; File.Delete(pn1S);
                    }
                    catch (Exception ex)
                    {
                        Log.Error(Log._PORTAL, String.Format("UpdateZdjecie.Delete oid:{0} step:{5} from:{1} to:{2} from_th:{3} to_th:{4}", oid, pn1S, pn1D, pn2S, pn2D, step), ex.Message);
                    }
                    //step = 4; File.Delete(pn2D);
                    step = 5; File.Copy(pn2S, pn2D, true);
                    try
                    {
                        step = 6; File.Delete(pn2S);
                    }
                    catch (Exception ex)
                    {
                        Log.Error(Log._PORTAL, String.Format("UpdateZdjecie.Delete oid:{0} step:{5} from:{1} to:{2} from_th:{3} to_th:{4}", oid, pn1S, pn1D, pn2S, pn2D, step), ex.Message);
                    }

                    /*
                    step = 1; File.Delete(pn1D);
                    step = 2; File.Move(pn1S, pn1D);
                    step = 3; File.Delete(pn2D);
                    step = 4; File.Move(pn2S, pn2D);  
                        */
                    hidImage.Value = zdjecieD;   // jakby 2 raz wszedł, to wywala błąd, a nie musi nic robić ...
                    ok = true;
                }
                catch (Exception ex)
                {
                    Log.Error(Log._PORTAL, String.Format("UpdateZdjecie oid:{0} step:{5} from:{1} to:{2} from_th:{3} to_th:{4}", oid, pn1S, pn1D, pn2S, pn2D, step), ex.Message);
                }
                if (ok)
                    ok = db.execSQL(db.conP, String.Format("update poOgloszenia set Zdjecie = '{0}' where Id = {1}", zdjecieD, oid));
                return ok;
            }
            else
                return true; // nie jest wymagana zmiana
        }
        //-----------------------------------------











        private void GetImageSize(int origwidth, int origheight, int maxwidth, int maxheight, out int width, out int height)  // na razie założenie maxwidth = maxheight
        {
            if (origwidth > origheight)
            {
                width = maxwidth;
                height = origheight * maxwidth / origwidth;
            }
            else
            {
                height = maxheight;
                width = origwidth * maxheight / origheight;
            }
        }

        public static string UrlRegulamin
        {
            get { return cntOgloszenia.GetImageUrl(PortalUstawienia.FileRegulamin); }
        }

        private string MapImagesPath
        {
            get { return Server.MapPath(cntOgloszenia.ImagesPath); }
        }
        /*
        private void ImageShowError(string msg)
        {
            lbImageError.Text = msg;
            //lbImageError.Visible = !String.IsNullOrEmpty(msg);
        }
        */
        protected void FileUploadComplete(object sender, AsyncFileUploadEventArgs e)
        {
            int err = 0;
            string filename = null;
            string ext = Path.GetExtension(AsyncFileUpload1.PostedFile.FileName).ToLower();
            string[] ia = imgAllowed.Split(',');


            //if (!ext.IsAny(".png", ".jpg", ".jpeg", ".gif"))
            if (!ia.Any(a => ("." + a).Equals(ext)))
                //ImageShowError("Niepoprawny format pliku. Dozwolone formaty to .png, .jpg, .jpeg, .gif.");
                err = -1;
            else if (Int32.Parse(e.FileSize) > PortalUstawienia.maxFileSizeB * 1024)
                //ImageShowError("Zbyt duży rozmiar pliku. Dopuszczalny rozmiar to 1MB.");
                err = -2;
            else
            {
                string oid = OgloszenieId;
                bool create = String.IsNullOrEmpty(oid);
                oid = "tmp" + (create ? App.User.Id : oid);    // user na raz tylko jedno zdjęcie może wgrywać, albo zamienić na guid ?
                filename = oid + ext;
                hidImage.Value = filename;
                string path = MapImagesPath;
                string pathname = path + filename;
                try
                {
                    AsyncFileUpload1.SaveAs(pathname);
                    //----- big -----
                    System.Drawing.Image big = System.Drawing.Image.FromFile(pathname);
                    //----- thumb -----
                    if (big.PropertyIdList.Contains(0x112)) //0x112 = Orientation
                    {
                        var prop = big.GetPropertyItem(0x112);
                        if (prop.Type == 3 && prop.Len == 2)
                        {
                            UInt16 orientationExif = BitConverter.ToUInt16(big.GetPropertyItem(0x112).Value, 0);
                            if (orientationExif == 8)
                            {
                                big.RotateFlip(RotateFlipType.Rotate270FlipNone);
                            }
                            else if (orientationExif == 3)
                            {
                                big.RotateFlip(RotateFlipType.Rotate180FlipNone);
                            }
                            else if (orientationExif == 6)
                            {
                                big.RotateFlip(RotateFlipType.Rotate90FlipNone);
                            }
                        }
                    }
                    int width, height;
                    GetImageSize(big.Width, big.Height, 150, 150, out width, out height);
                    System.Drawing.Image small = big.GetThumbnailImage(width, height, () => false, IntPtr.Zero);
                    small.Save(path + "thumb_" + filename);
                }
                catch (Exception ex)
                {
                    err = -3;
                }
            }
            //----- ustawienie wartości, i zrobienie setTimeout()...click() - dopiero tak w btImage_Click zmiana Visible,Text działa
            string msg;
            switch (err)
            {
                case 0:
                    msg = null;
                    break;
                case -1:
                    msg = String.Format(errFileFormat, imgAllowed);
                    break;
                case -2:
                    msg = String.Format(errFileSize, PortalUstawienia.maxFileSizeMB);
                    break;
                default:
                case -3:
                    msg = errUpload;
                    break;
            }

            Tools.ExecOnStart2("eico", String.Format(hidScript.Value
                /*
                @"
                top.document.getElementById('{0}').src='{1}?' + new Date().getTime();
                top.document.getElementById('{2}').value='{3}';
                top.document.getElementById('{4}').value='{5}';
                setTimeout(function() {{ top.document.getElementById('{6}').click(); }}, 20);"
                 */
                , Image1.ClientID, cntOgloszenia.GetThumbUrlNoCache(filename)        //0,1
                , hidImage.ClientID, filename                   //2,3
                , hidImageError.ClientID, err                   //4,5
                , hidImageErrorMsg.ClientID                     //6 
                , lbImageError.ClientID, msg                    //7,8
                , btImageDelete.ClientID                        //9
                //, btImage.ClientID
                ));
        }

        protected void FileUploadError(object sender, AsyncFileUploadEventArgs e)
        {
            if (e.State == AsyncFileUploadState.Failed)
                Tools.ShowError(errUpload);
        }
        /*
        protected void btImage_Click(object sender, EventArgs e)
        {
            //----- show -----
            //ImageShowError("Załadowano!");
            //lbTitleEdycja.Text = "asdasdasdasdasd asd asd asdasdas sdfsdfs";
            //btImageDelete.Visible = true;
            //Tools.ShowMessage("aaa");

            int err = Tools.StrToInt(hidImageError.Value, 0);
            switch (err)
            {
                case 0:
                    Image1.ImageUrl = cntOgloszenia.GetThumbUrlNoCache(hidImage.Value);        // zawsze się tak samo nazywa
                    btImageDelete.Visible = true;

                    UpdatePanel up = Tools.FindUpdatePanel(btImageDelete);
                    if (up.UpdateMode == UpdatePanelUpdateMode.Conditional)
                        up.Update();

                    Log.Info(Log.DEBUG, "btImageDelete.Visible = true;", null);

                    break;
                default:
                    Image1.ImageUrl = null;
                    hidImage.Value = null;
                    btImageDelete.Visible = false;
                    break;
            }
            switch (err)
            {
                case 0:
                    break;
                case -1:
                    Tools.ShowError(errFileFormat, imgAllowed);
                    break;
                case -2:
                    Tools.ShowError(errFileSize, PortalUstawienia.maxFileSizeMB);
                    break;
                default:
                case -3:
                    Tools.ShowError(errUpload);
                    break;
            }
        }
        */
        protected void cbRegAcc_CheckedChanged(object sender, EventArgs e)
        {
            modalSave.Enabled = cbRegAcc.Checked;
        }

        //-----------------------
        private string OgloszenieId
        {
            set { ViewState["oid"] = value; }
            get { return Tools.GetStr(ViewState["oid"]); }
        }

        private string DeleteImageFileName
        {
            set { ViewState["imgdelfn"] = value; }
            get { return Tools.GetStr(ViewState["imgdelfn"]); }
        }

        public bool Resend
        {
            set { ViewState["reinit"] = value; }
            get { return Tools.GetBool(ViewState["reinit"], false); }
        }

        protected void lbtRegulamin_Click(object sender, EventArgs e)
        {
            if (Regulamin != null)
                Regulamin(this, EventArgs.Empty);
        }

    }
}