using MindBox_AreaCalculation;

namespace AreaCalculation.Tests
{
    public class CircleTests
    {
        [Fact]
        public void CircleAreaCheck()
        {
            // Arrange
            var triangle = ShapeCreator.CreateShape(2);
            double area = 12.57;

            // Act

            // Assert
            Assert.Equal(area, triangle.Area);
        }

        [Fact]
        public void FailedNegativeRadiusValueCheck()
        {
            // Arrange
            Action act = () => ShapeCreator.CreateShape(0);

            // Act
            ArgumentException exception = Assert.Throws<ArgumentException>(act);

            // Assert
            Assert.Equal("Некорректное значение. Радиус должен быть больше 0", exception.Message);
        }
    }
}
