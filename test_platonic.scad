include <platonic.scad>

//test_polyhedron(tetrahedron(1));
//test_polyhedron(hexahedron(1));
//test_polyhedron(octahedron(1));
//test_polyhedron(dodecahedron(1));
//test_polyhedron(icosahedron(1));
//test_dodeca(dodecahedron(2));
//test_icosa(icosahedron(1));

//test_dual();
test_dual_cube1(20);
//test_dual_cube2(20);
//test_dual_cube3(20);

//display_platonics(20);

module display_polyhedron(poly) 
{
	polyhedron(points = poly[0], triangles = poly[1]);
}

module display_platonics(rad=1)
{
	// At the center, the self dual tetrahedron
	display_polyhedron(tetrahedron(rad));


	translate(rad*[3, 3, 0])
	display_polyhedron(icosahedron(rad));
	
	translate(rad*[-3, -3, 0])
	display_polyhedron(dodecahedron(rad));
	

	translate(rad*[-3, 3, 0])
	display_polyhedron(hexahedron(rad));
	translate(rad*[3,-3,0])
	display_polyhedron(octahedron(rad));

	
}

module print_spherical_to_cartesian(sverts) 
{
//echo("cvert_spherical: ", cverts_spherical);
//print_spherical_to_cartesian(cverts_spherical);

// echo(sph_to_cart(sph(0,45)));
// echo(sph_to_cart(sph(90,45)));
// echo(sph_to_cart(sph(180,45,1)));
// echo(sph_to_cart(sph(270,45)));

// echo(sph_from_cart([-0.707107, 0, 0.707107]));
	for (vert = sverts)
	{
		echo(sph_to_cart(vert));
	}

}

module test_degrees() 
{
	d1 = deg(25, 17, 16);
	d2 = deg(18,34);

	echo("deg: ", d1, " decimal: ", deg_to_dec(d1));
	echo("deg: ", d2, " decimal: ", deg_to_dec(d2));
}

module display_poly_verts(verts)
{
	for (vert = verts)
	{
		translate(vert)
		sphere(r=0.1, $fn=24);
	}
}

module test_polyhedron(poly)
{
	display_poly_verts(poly[0]);

	//scale([8,8,8])
	display_polyhedron(poly);

	color([0.5, 0.5, 0.5, 0.4])
	sphere(r=prad, $fn=24);

}

module test_dual()
{
	difference()
	{
	display_polyhedron(dodecahedron(1));
	display_polyhedron(icosahedron(1));
	}
}

module test_dodeca(poly)
{
	verts = poly[0];
	faces = poly[1];

	difference()
	{
		display_polyhedron(poly);

		cylinder(r=0.5, h=2, center=true, $fn=24);
	}

//	display_poly_verts(verts);
//
//	color([0/5, 0/5, 0/5, 1])
//	polyhedron(points=verts, 
//		triangles=[
//			[0,1,2,3],
//		]);
//
//	color([2/5, 2/5, 2/5, 1])
//	polyhedron(points=verts, 
//		triangles=[
//			[4,5,6,7],
//		]);
//
//	color([3/5, 3/5, 3/5, 1])
//	polyhedron(points=verts, 
//		triangles=[
//			[8,9,10,11],
//		]);
//
//	color([4/5, 4/5, 4/5, 1])
//	polyhedron(points=verts, 
//		triangles=[
//			[12,13,14,15],
//		]);
//
//	color([5/5, 5/5, 5/5, 1])
//	polyhedron(points=verts, 
//		triangles=[
//			[16,17,18,19]
//		]);
//
//// 0,1,2,4
//	polyhedron(points=verts,
//		triangles=[
//			[1,9,8,0,17],
//			[9,1,14,15,2],
//			[9,2,16,3,8],
//			[8,3,12,13,0],
//			[0,13,4,18,17],
//			[1,17,18,7,14],
//			[15,14,7,10,6],
//			[2,15,6,19,16],
//			[16,19,5,12,3],
//			[12,5,11,4,13],
//			[18,4,11,10,7],
//			[19,6,10,11,5]
//		]);
}



module test_icosa(poly)
{
	verts = poly[0];
	faces = poly[1];

//	difference()
//	{
//		display_polyhedron(poly);
//
//		cylinder(r=0.5, h=2, center=true, $fn=24);
//	}

	display_poly_verts(verts);

	color([0/5, 0/5, 0/5, 1])
	polyhedron(points=verts, 
		triangles=[
			[0,1,2,3],
		]);

	color([2/5, 2/5, 2/5, 1])
	polyhedron(points=verts, 
		triangles=[
			[4,5,6,7],
		]);

	color([3/5, 3/5, 3/5, 1])
	polyhedron(points=verts, 
		triangles=[
			[8,9,10,11],
		]);

	polyhedron(points=verts,
		triangles=[
			[3,0,4],
			[3,4,9],
			[3,9,10],
			[3,10,7],
			[3,7,0],
			[0,8,4],
			[0,7,11],
			[0,11,8],
			[4,8,5],
			[4,5,9],
			[7,10,6],
			[7,6,11],
			[9,5,2],
			[9,2,10],
			[2,6,10],
			[1,5,8],
			[1,8,11],
			[1,11,6],
			[5,1,2],
			[2,1,6]
		]);
}

module test_dual_cube1(rad=1)
{
	// Union
	display_polyhedron(hexahedron(rad));
	display_polyhedron(octahedron(rad));	
}

module test_dual_cube2(rad=1)
{
	// Difference
	difference()
	{
		display_polyhedron(hexahedron(rad));
		display_polyhedron(octahedron(rad));
	}
}

module test_dual_cube3(rad=1)
{
	// Intersection, for truncation
	intersection()
	{
		display_polyhedron(hexahedron(rad));
		display_polyhedron(octahedron(rad));
	}	
}
