include <platonic.scad>


poly = dodecahedron(1);
polyhedron(points = poly[0], triangles = poly[1]);