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
    /// Логика взаимодействия для Search.xaml
    /// </summary>
    public partial class Search : Window
    {
        public Search()
        {
            InitializeComponent();
            Annoc.ItemsSource = Pr_29Entities.GetContext().Announcement.ToList();
        }

        private void Hide_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }
        private void Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                //ListUser.ItemsSource = AppData.db.Announcement.Where(u => u.PublicationName == TBoxSearch.Text || u.PublicationName.Contains(TBoxSearch.Text)).ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка!" + ex.ToString());
            }
        }

        private void ListUser_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
