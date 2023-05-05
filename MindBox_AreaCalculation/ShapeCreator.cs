namespace MindBox_AreaCalculation
{
    public static class ShapeCreator
    {
        /// <summary>
        /// Создание треугольника по трем сторонам
        /// </summary>
        /// <param name="a">Первая сторона треугольника</param>
        /// <param name="b">Вторая сторона треугольника</param>
        /// <param name="c">Третья сторона треугольника</param>
        /// <returns></returns>
        public static Shape CreateShape(int a, int b, int c)
        {
            if (a <= 0 || b <= 0 || c <= 0)
                throw new ArgumentException("Некорректное значение. Длины сторон треугольника должны быть больше 0");

            if (a >= b + c || b >= a + c || c >= a + b)
                throw new ArgumentException("Длина любой стороны треугольника не может быть больше суммы длин двух других сторон");

            return new Triangle(a, b, c);
        }

        /// <summary>
        /// Создание круга по радиусу
        /// </summary>
        /// <param name="r">Радиус круга</param>
        /// <returns></returns>
        public static Shape CreateShape(int r)
        {
            if (r <= 0)
                throw new ArgumentException("Некорректное значение. Радиус должен быть больше 0");

            return new Circle(r);
        }
    }
}
