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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
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

        private void ToAddEdit_Click(object sender, RoutedEventArgs e)
        {
            var ToAddEdit = new AddEdit(null);
            ToAddEdit.Show();
            this.Close();
        }

        private void ToSearch_click(object sender, RoutedEventArgs e)
        {
            var ToSearch = new Search();
            ToSearch.Show();
            this.Close();
        }
        private void Window_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            /*if (Visibility == Visibility.Visible)
            {
                Pr_29Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                Annoc.ItemSource = Pr_29Entities.GetContext().Announcement.ToList();
            }*/
        }
    }
}
