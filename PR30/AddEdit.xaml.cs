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
    /// Логика взаимодействия для AddEdit.xaml
    /// </summary>
    public partial class AddEdit : Window
    {
        private Announcement _curentFilms = new Announcement();
        public AddEdit(Announcement selectedFilm)
        {
            InitializeComponent();
            if (selectedFilm != null)
            {
                _curentFilms = selectedFilm;
            }
            DataContext = _curentFilms;
            ComboCat.ItemsSource = Pr_29Entities.GetContext().Categories.ToList();
        }

        private void Hide_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }
        private void Close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            var ToMain = new MainWindow();
            ToMain.Show();
            this.Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (_curentFilms.PublicationDate.HasValue == false)
                errors.AppendLine("Укажите другое время");
            if (_curentFilms.ProductCost > 9999999 || _curentFilms.ProductCost < 0)
                errors.AppendLine("Укажите другую цену!");
            if (string.IsNullOrWhiteSpace(_curentFilms.PublicationName))
                errors.AppendLine("Укажите другое название");
            if (string.IsNullOrWhiteSpace(_curentFilms.ProductCondition))
                errors.AppendLine("Укажите состояние товара!");
            if (string.IsNullOrWhiteSpace(_curentFilms.Description))
                errors.AppendLine("Укажите описание товара!");
            if (string.IsNullOrWhiteSpace(_curentFilms.PaymentMethod))
                errors.AppendLine("Укажите способ оплаты товара!");
            if (string.IsNullOrWhiteSpace(_curentFilms.DeliveryMethod))
                errors.AppendLine("Укажите способ доставки товара!");
            if (_curentFilms.CategoryId != 0)
                errors.AppendLine("Укажите жанр фильма");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            _curentFilms.SellerId = GlobalEntities.id;
            Pr_29Entities.GetContext().Announcement.Add(_curentFilms);

            try
            {
                Pr_29Entities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!");

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
