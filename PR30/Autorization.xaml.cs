using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PR30
{
    /// <summary>
    /// Логика взаимодействия для Autorization.xaml
    /// </summary>
    public partial class Autorization : Window
    {
        AppData db;
        public Autorization()
        {
            InitializeComponent();
            db = new AppData();
            if (Properties.Settings.Default.UserLogin != string.Empty)
            {
                Login.Text = Properties.Settings.Default.UserLogin;
                PasswordBox.Password = Properties.Settings.Default.UserPassword;
            }
        }

        private void Hide_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }
        private void Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ToReg_Click(object sender, RoutedEventArgs e)
        {
            var ToReg = new Registration();
            ToReg.Show(); 
            this.Close();
        }

        private void ToMain_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //var password = md5.hashPassword(PasswordBox.Password.ToString());
                var CurrentUser = AppData.db.Sellers.FirstOrDefault(u => u.Login == Login.Text && u.Password == PasswordBox.Password.ToString());
                if (CurrentUser != null)
                {
                    GlobalEntities.LoginE = CurrentUser.Login;
                    GlobalEntities.Email = CurrentUser.Email;
                    GlobalEntities.PhoneNumberE = CurrentUser.PhoneNumber;
                    GlobalEntities.PasswordE = CurrentUser.Password;
                    GlobalEntities.UnHashPassword = PasswordBox.Password.ToString();
                    var ToMain = new MainWindow();
                    ToMain.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Упс, кажется вы ввели неверный логин или пароль!");
                }
            }
            catch
            {
                MessageBox.Show("Кажется, на сервере технические неполадки. Попробуйте повторить попытку");
            }
        }

        private void ToMainGuest_Click(object sender, RoutedEventArgs e)
        {
            var ToSearch = new Search();
            ToSearch.Show();
            this.Close();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
