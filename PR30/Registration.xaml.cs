using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace PR30
{
    /// <summary>
    /// Логика взаимодействия для Registration.xaml
    /// </summary>
    public partial class Registration : Window
    {
        public Registration()
        {
            InitializeComponent();
        }
        private void Hide_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }
        private void Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ToAuth_Click(object sender, RoutedEventArgs e)
        {
            var ToAuth = new Autorization();
            ToAuth.Show();
            this.Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (password.Text != confPass.Text)
            {
                MessageBox.Show("Пароли не совпадают!");
            }
            else
            {
                if(Login.Text.Length <= 50 && Login.Text != "") 
                {
                    Sellers people = new Sellers();
                    people.Password = password.Text;
                    people.Login = Login.Text.Trim();
                    AppData.db.Sellers.Add(people);
                    AppData.db.SaveChanges();
                    Thread.Sleep(1000);
                    MessageBox.Show("Вы успешно зарегестрировались!");
                    var auth = new Autorization();
                    auth.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Неверный логин");
                }
            }
        }
    }
}
