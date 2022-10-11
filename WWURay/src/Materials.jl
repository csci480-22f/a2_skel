module Materials

using Images
using FileIO

using ..GfxBase

export Material, Texture
export ShadingModel, Flat, Normal
export PhysicalShadingModel, Lambertian, BlinnPhong

export get_diffuse

## Shading model type hierarchy ##
# Types are as follows:
# 
# ShadingModel
#   - Flat - simply the diffuse color of the object
#   - Normal - color-code a pixel according to its surface normal
#   - PhysicalShadingModel
#       - Lambertian - diffuse shading
#       - BlinnPhong - diffuse+specular shading

abstract type ShadingModel end
struct Flat<:ShadingModel end
struct Normal <: ShadingModel end

abstract type PhysicalShadingModel <: ShadingModel end

struct Lambertian <: PhysicalShadingModel end

mutable struct BlinnPhong <: PhysicalShadingModel
    specular_color::RGB{Float32} # color of the highlight
    specular_exp::Float64 # "sharpness" exponent
end

## Texture struct definition ##
mutable struct Texture
    image_data::Array{RGB{Float32},2}
    repeat::Bool
end

""" Texture constructor - loads image data from a file"""
function Texture(image_fn::String, repeat::Bool)
    image_data = load(image_fn)
    Texture(image_data, repeat)
end

## Material struct definition ##
mutable struct Material
    shading_model::ShadingModel
    mirror_coeff::Float64
    texture::Union{Texture,Nothing}
    diffuse_color::Union{RGB{Float32},Nothing}
end

""" Get the diffuse color of a material; if the material is textured,
provide the uv coordinate on the object of that material. """
function get_diffuse(material::Material, uv::Union{Vec2,Nothing})
    ###########
    # TODO 9b #
    ###########
    # Placeholder:
    return material.diffuse_color
    ##########
    # Your implementation:
    #
    ###############
    # END TODO 8b #
    ###############
end

""" Look up a texture value given the uv coordinates """
function get_texture_value(texture::Texture, uv::Vec2)
    ###########
    # TODO 9a #
    ###########
    # Placeholder:
    return RGB{Float32}(1,1,1)
    # Your implementation:
    #
    ###############
    # END TODO 9a #
    ###############
end

end # module Materials
