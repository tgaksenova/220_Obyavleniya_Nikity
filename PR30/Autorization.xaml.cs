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
        public Autorization()
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

        private void ToReg_Click(object sender, RoutedEventArgs e)
        {
            var ToReg = new Registration();
            ToReg.Show(); 
            this.Close();
        }

        private void ToMain_Click(object sender, RoutedEventArgs e)
        {
            var ToMain = new MainWindow();
            ToMain.Show();
            this.Close();
        }

        private void ToMainGuest_Click(object sender, RoutedEventArgs e)
        {
            var ToSearch = new Search();
            ToSearch.Show();
            this.Close();
        }
    }
}
