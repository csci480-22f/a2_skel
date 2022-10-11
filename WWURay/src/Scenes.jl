module Scenes

export HitRecord, Sphere, Scene, TriangleMesh, ray_intersect, create_triangles
#export has_uvs, has_normals, get_vertex, get_uv, get_normal

using LinearAlgebra

#push!(LOAD_PATH, pwd())
using ..GfxBase
using ..WWUMeshes
using ..Materials



#####################################
###### Generic Scene Data Type ######
#####################################
struct Scene
    background::RGB{Float32}
    objects::Array{Any,1}
    lights::Array{Any,1}
end

""" Structure to store data about an intersection
of a ray with an object (a "hit")."""
mutable struct HitRecord
    t::Float64
    intersection::Vec3
    normal::Vec3
    uv::Union{Vec2,Nothing}
    object
end

# Abstract ray-object intersection function:
# Needs to be implemented for each type of object to be rendered
""" Intersect a ray with an object.
Returns a HitRecord with info about the intersetion, or nothing if
the ray doesn't intersect with the object. """
function ray_intersect(ray::Ray, object) end


##################
##### Sphere #####
##################

# Data type:
struct Sphere
    center::Vec3
    radius::Float64
    material::Material
end

""" Ray-sphere intersection. """
function ray_intersect(ray::Ray, object::Sphere)

    #######################
    # TODO 1 (ray-sphere) #
    #######################
    # Your implementation:
    #
    ##############
    # END TODO 1 #
    ##############

    ################################################################
    # TODO 9c - modify above to fill in Hitrec's texture coordinates
    ################################################################
end


###########################
###### Triangle Mesh ######
###########################

""" Data type: stores the OBJTriangle, a reference to its Mesh
object, and the material it should be rendered with. """
struct Triangle
    geometry::OBJTriangle
    mesh::OBJMesh
    material
end

""" Return an Array of all Triangles belonging to the given mesh, assigning
each one the given material. """
function create_triangles(mesh::OBJMesh, material)
    [Triangle(f, mesh, material) for f in mesh.triangles]
end

""" Some helper functions that make for easier access to triangle data: """
function get_vertex(tri::Triangle, i)
    tri.mesh.positions[tri.geometry.positions[i]]
end

function has_uvs(tri::Triangle)
    length(tri.geometry.uvs) == 3
end

function get_uv(tri::Triangle, i)
    tri.mesh.uvs[tri.geometry.uvs[i]]
end

function has_normals(tri::Triangle)
    length(tri.geometry.normals) == 3
end

function get_normal(tri::Triangle, i)
    tri.mesh.normals[tri.geometry.normals[i]]
end


function ray_intersect(ray::Ray, object::Triangle)
    
    ##########
    # TODO 7 #
    ##########
    # Your implementation:
    #
    ##############
    # END TODO 7 #
    ##############

    ################################################################
    # TODO 9c - modify above to fill in Hitrec's texture coordinates
    ################################################################
end

end # module Scenes
