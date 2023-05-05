namespace MindBox_AreaCalculation
{
    public class Triangle : Shape
    {
        public double FirstSide { get; set; }

        public double SecondSide { get; set; }

        public double ThirdSide { get; set; }

        public bool IsRectangular => CheckIsRectangular();


        public Triangle(double firstSide, double secondSide, double thirdSide)
        {
            FirstSide = firstSide;
            SecondSide = secondSide;
            ThirdSide = thirdSide;
            Type = TypesOfShape.Triangle;
        }

        /// <summary>
        /// Расчет площади по формуле Герона
        /// </summary>
        /// <returns></returns>
        public sealed override double AreaCalculation()
        {
            var semiPerimeter = (FirstSide + SecondSide + ThirdSide) / 2;
            return Math.Round(Math.Sqrt(
                semiPerimeter * (semiPerimeter - FirstSide) * (semiPerimeter - SecondSide) * (semiPerimeter - ThirdSide)), 2);
        }

        /// <summary>
        /// Проверка, является ли треугольник прямоугольным
        /// </summary>
        /// <returns></returns>
        public bool CheckIsRectangular()
        {
            var sides = new[] { FirstSide, SecondSide, ThirdSide };

            // Ищем индекс наибольшей стороны (потенциальной гипотенузы)
            var hypotenuseId = Array.IndexOf(sides, sides.Max());

            // Считаем сумму квадратов остальных катетов
            var sumSquaredSides = sides.Where((t, i) => i != hypotenuseId).Sum(t => Math.Pow(t, 2));

            // Квадрат гипотенузы = сумме квадратов катетов в прямоугольном треугольнике
            return Math.Pow(sides[hypotenuseId], 2).Equals(sumSquaredSides);
        }
    }
}
