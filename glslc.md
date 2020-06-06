SHADERC(1)                                       glslc                                      SHADERC(1)

NAME
       shaderc - glslc

SYNOPSIS
       glslc [options] file...

DESCRIPTION
       glslc - Compile shaders into SPIR-V

       An input file of - represents standard input.

OPTIONS
       -c     Only run preprocess, compile, and assemble steps.

       -Dmacro[=defn]
              Add an implicit macro definition.

       -E     Outputs only the results of the preprocessing step.  Output defaults to standard output.

       -fauto-bind-uniforms
              Automatically assign bindings to uniform variables that don't have an explicit 'binding'
              layout in the shader source.

       -fauto-map-locations
              Automatically assign locations to uniform variables that don't have an  explicit  'loca‐
              tion' layout in the shader source.

       -fhlsl-iomap
              Use HLSL IO mappings for bindings.

       -fhlsl_functionality1, -fhlsl-functionality1
              Enable extension SPV_GOOGLE_hlsl_functionality1 for HLSL compilation.

       -fimage-binding-base [stage] <value>
              Sets  the  lowest automatically assigned binding number for images.  Optionally only set
              it for a single shader stage.  For HLSL, the resource register number is added  to  this
              base.

       -ftexture-binding-base [stage] <value>
              Sets the lowest automatically assigned binding number for textures.  Optionally only set
              it for a single shader stage.  For HLSL, the resource register number is added  to  this
              base.

       -fsampler-binding-base [stage] <value>
              Sets  the lowest automatically assigned binding number for samplers  Optionally only set
              it for a single shader stage.  For HLSL, the resource register number is added  to  this
              base.

       -fubo-binding-base [stage] <value>
              Sets  the lowest automatically assigned binding number for uniform buffer objects (UBO).
              Optionally only set it for a single shader stage.  For HLSL, the resource register  num‐
              ber is added to this base.

       -fcbuffer-binding-base [stage] <value>
              Same as -fubo-binding-base.

       -fssbo-binding-base [stage] <value>
              Sets  the lowest automatically assigned binding number for shader storage buffer objects
              (SSBO).  Optionally only set it for a single shader stage.  Only affects GLSL.

       -fuav-binding-base [stage] <value>
              For automatically assigned bindings for unordered access views (UAV), the register  num‐
              ber is added to this base to determine the binding number.  Optionally only set it for a
              single shader stage.  Only affects HLSL.

       -fresource-set-binding [stage] <reg0> <set0> <binding0>
              [<reg1> <set1> <binding1>...]

       Explicitly sets the descriptor set and binding for
              HLSL resources, by register name.  Optionally restrict it to a single stage.

       -fentry-point=<name>
              Specify the entry point name for HLSL compilation, for all subsequent source files.  De‐
              fault is "main".

       -flimit=<settings>
              Specify  resource limits. Each limit is specified by a limit name followed by an integer
              value.  Tokens should be separated by whitespace.  If the same limit is  specified  sev‐
              eral times, only the last setting takes effect.

       --show-limits
              Display available limit names and their default values.

       -flimit-file <file>
              Set limits as specified in the given file.

       -fshader-stage=<stage>
              Treat  subsequent  input  files as having stage <stage>.  Valid stages are vertex, vert,
              fragment, frag, tesscontrol, tesc, tesseval, tese, geometry, geom, compute, and comp.

       -g     Generate source-level debug information.  Currently this option has no effect.

       --help Display available options.

       --version
              Display compiler version information.

       -I <value>
              Add directory to include search path.

       -o <file>
              Write output to <file>.  A file name of '-' represents standard output.

       -std=<value>
              Version and profile for GLSL input files. Possible values are concatenations of  version
              and profile, e.g. 310es, 450core, etc.  Ignored for HLSL files.

       -mfmt=<format>
              Output  SPIR-V  binary code using the selected format. This option may be specified only
              when the compilation output is in SPIR-V binary code  form.  Available  options  include
              bin, c and num. By default the binary output format is bin.

       -M     Generate make dependencies. Implies -E and -w.

       -MM    An alias for -M.

       -MD    Generate make dependencies and compile.

       -MF <file>
              Write dependency output to the given file.

       -MT <target>
              Specify the target of the rule emitted by dependency generation.

       -S     Only run preprocess and compilation steps.

       --target-env=<environment>
              Set  the  target  client  environment, and the semantics of warnings and errors.  An op‐
              tional suffix can specify the client version.  Values are:

       vulkan1.0
              # The default

       vulkan1.1
              vulkan          # Same as vulkan1.0 opengl4.5 opengl          # Same as opengl4.5

       -w     Suppresses all warning messages.

       -Werror
              Treat all warnings as errors.

       -x <language>
              Treat subsequent input files as having type  <language>.   Valid  languages  are:  glsl,
              hlsl.  For files ending in .hlsl the default is hlsl.  Otherwise the default is glsl.

       -fhlsl-offsets
              Use HLSL offset rules for packing members of blocks.  Affects only GLSL.  HLSL rules are
              always used for HLSL.

       spirv-tools        v2018.5-dev         e0c7f25465a93b0d294295515eb2e6e6157e94f7         glslang
       e0c7f25465a93b0d294295515eb2e6e6157e94f7

       Target: SPIR-V 1.0

shaderc                                        July 2018                                    SHADERC(1)
