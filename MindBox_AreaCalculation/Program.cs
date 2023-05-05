using MindBox_AreaCalculation;

var shapeGroup = new List<Shape>()
{
    ShapeCreator.CreateShape(2),
    ShapeCreator.CreateShape(3,5,4),
    ShapeCreator.CreateShape(2,2,3)
};

foreach (var shape in shapeGroup)
{
    Console.WriteLine(shape.Type == TypesOfShape.Triangle
        ? $"{shape.Type} shapeArea = {shape.Area} isRectangular = {((Triangle)shape).IsRectangular}"
        : $"{shape.Type} shapeArea = {shape.Area}");
}


