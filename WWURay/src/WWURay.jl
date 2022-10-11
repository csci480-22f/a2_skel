""" 
Main module for CS480/580 A2 raytracer. Contains core raytracing algrithm,
while referencing several other modules that encapsulate supporting
functionality.
"""

module WWURay

export main

using FileIO
using Images
using StaticArrays
using LinearAlgebra

push!(LOAD_PATH, pwd())
include("GfxBase.jl")
include("Lights.jl")
include("Materials.jl")
include("WWUMeshes.jl")
include("Scenes.jl")
include("Cameras.jl")
include("TestScenes.jl")

using .GfxBase
using .Lights
using .Materials

import .Scenes
import .Scenes.Scene
import .Scenes.HitRecord
import .Cameras
import .TestScenes

# Ray-Scene intersection:
""" Find the closest intersection point among all objects in the scene
along a ray, constraining the search to values of t between tmin and tmax. """
function closest_intersect(objects::Array{Any, 1}, ray::Ray, tmin, tmax)
    ##########
    # TODO 2 #
    ##########
    # Your implementation:
    #
    #############
    # END TODO 2
    #############
end

""" Trace a ray from orig along ray through scene, using Whitted recursive raytracing 
limited to rec_depth recursive calls. """
function traceray(scene::Scene, ray::Ray, tmin, tmax, rec_depth=1)

    closest_hitrec = closest_intersect(scene.objects, ray, tmin, tmax)

    if closest_hitrec == nothing
        return scene.background
    end

    object = closest_hitrec.object
    point = closest_hitrec.intersection
    normal = closest_hitrec.normal
    material = object.material
    shader = material.shading_model

    local_color = determine_color(shader, object.material, ray, closest_hitrec, scene)

    ##############################
    # TODO 6 - mirror reflection #
    ##############################
    # Your implementation:
    #
    ############
    # END TODO 6
    ############
end

""" Determine the color of interesction point described by hitrec 
Flat shading - just color the pixel the material's diffuse color """
function determine_color(shader::Flat, material::Material, ray::Ray, hitrec::HitRecord, scene::Scene)
    get_diffuse(material, hitrec.uv)
end
""" Normal shading - color-code pixels according to their normals """
function determine_color(shader::Normal, material::Material, ray::Ray, hitrec::HitRecord, scene::Scene)
    normal_color = normalize(hitrec.normal) / 2 .+ 0.5
    RGB{Float32}(normal_color...)
end


""" Determine the color of a physical (Lambertian, BlinnPhong, etc.) surface """
function determine_color(shader::PhysicalShadingModel, material::Material, ray::Ray, hitrec::HitRecord, scene::Scene)
    ###########
    # TODO 4c
    # Pseudocode:
    # start with a black color value
    # for each light in the scene:
    #   determine the light's contribution (by calling shade_light)
    #   add the light's contribution into the color
    # return the resulting color
    #
    #############
    # END TODO 4c
    #############

    ###############################################
    # TODO 5b - modify above to account for shadows
    ###############################################
end

""" shade_light(shader, material, ray, hitrec, light, scene)
Determine the color contribution of the given light along the given ray.
Color depends on the material, the shading model (shader), properties of the intersection 
given in hitrec, """
function shade_light(shader::Lambertian, material::Material, ray::Ray, hitrec, light, scene)
    ###########
    # TODO 4b #
    ###########
    # Your implementation:
    #
    # END TODO 4b
    #############
end

""" Blinn-Phong surface shading """
function shade_light(shader::BlinnPhong, material::Material, ray::Ray, hitrec, light, scene)
    ###########
    # TODO 4d #
    ###########
    # Your implementation:
    #
    #############
    # END TODO 4d
    #############
end


""" Determine whether point is in shadow wrt light """
###########
# TODO 5a #
###########
# Placeholder:
function is_shadowed(scene, light::Light, point::Vec3)
    false
end
##########
# Your implementation (two methods):
#
##############
# END TODO 5a #
##############

# Main loop:
function main(scene, camera, height, width, outfile)

    # get the requested scene and camera
    scene = TestScenes.get_scene(scene)
    camera = TestScenes.get_camera(camera, height, width)

    # Create a blank canvas to store the image:
    canvas = zeros(RGB{Float32}, height, width)


    ##########
    # TODO 3 #
    ##########
    # Pseudocode:
    #   loop over all pixels in the image
    #   for each pixel, get a viewing ray from the camera
    #   then call traceray to determine its color
    #
    ##############
    # END TODO 3 #
    ##############

    # clamp canvas to valid range:
    clamp01!(canvas)
    save(outfile, canvas)
end

end # module WWURay

