namespace MindBox_AreaCalculation
{
    /// <summary>
    /// Круг
    /// </summary>
    public class Circle : Shape
    {
        public double Radius { get; set; }

        public Circle(double radius)
        {
            Radius = radius;
            Type = TypesOfShape.Circle;
        }

        /// <summary>
        /// Расчет площади по радиусу
        /// </summary>
        /// <returns></returns>
        public sealed override double AreaCalculation()
        {
            return Math.Round(Math.PI * Math.Pow(Radius, 2), 2);
        }
    }
}
