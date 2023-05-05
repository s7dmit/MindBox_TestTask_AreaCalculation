using MindBox_AreaCalculation;

namespace AreaCalculation.Tests
{
    public class TriangleTests
    {
        [Fact]
        public void TriangleAreaCheck()
        {
            // Arrange
            var triangle = ShapeCreator.CreateShape(6, 10, 8);
            double area = 24;

            // Act

            // Assert
            Assert.Equal(area, triangle.Area);
        }

        [Fact]
        public void FailedBigSideValueCheck()
        {
            // Arrange
            Action act = () => ShapeCreator.CreateShape(3, 1, 5);

            // Act
            ArgumentException exception = Assert.Throws<ArgumentException>(act);

            // Assert
            Assert.Equal("Длина любой стороны треугольника не может быть больше суммы длин двух других сторон", exception.Message);
        }

        [Fact]
        public void FailedNegativeSideValueCheck()
        {
            // Arrange
            Action act = () => ShapeCreator.CreateShape(0, 1, 5);

            // Act
            ArgumentException exception = Assert.Throws<ArgumentException>(act);

            // Assert
            Assert.Equal("Некорректное значение. Длины сторон треугольника должны быть больше 0", exception.Message);
        }

        [Fact]
        public void FailedIsRectangularCheck()
        {
            // Arrange
            var triangle = ShapeCreator.CreateShape(2, 2, 3);

            // Act

            // Assert
            Assert.False(((Triangle)triangle).IsRectangular);
        }

        [Fact]
        public void SuccessfulIsRectangularCheck()
        {
            // Arrange
            var triangle = ShapeCreator.CreateShape(3, 4, 5);

            // Act

            // Assert
            Assert.True(((Triangle)triangle).IsRectangular);
        }
    }
}