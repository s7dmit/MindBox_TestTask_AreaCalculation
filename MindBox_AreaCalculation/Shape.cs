namespace MindBox_AreaCalculation
{
    /// <summary>
    /// Базовый класс фигур
    /// </summary>
    public abstract class Shape
    {
        /// <summary>
        /// Площадь
        /// </summary>
        public double Area => AreaCalculation();

        /// <summary>
        /// Название фигуры
        /// </summary>
        public TypesOfShape Type { get; set; }

        /// <summary>
        /// Метод расчета площади
        /// </summary>
        /// <returns></returns>
        public abstract double AreaCalculation();
    }
}
