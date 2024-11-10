using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.IO;
namespace TheCommunityEye.Images
{
    public class behind
    {
        public static bool IsValidEmail(string email)
        {
            string pattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

            return Regex.IsMatch(email, pattern);
        }

        public static bool IsValidPassword(string password)
        {
            string pattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$";

            return Regex.IsMatch(password, pattern);
        }
        private bool IsImage(HttpPostedFile postedFile)
        {
            string[] validFileTypes = { ".jpg", ".jpeg", ".png", ".gif" };
            string ext = Path.GetExtension(postedFile.FileName).ToLower();
            foreach (string fileType in validFileTypes)
            {
                if (ext == fileType)
                {
                    return true;
                }
            }
            return false;
        }
        private bool IsValidCardNumber(string cardNumber)
        {
            Regex regex = new Regex("^[0-9]{13,19}$");
            return regex.IsMatch(cardNumber);
        }
    }
}