# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Reading the implementation part of the package.
#

include( "gap/Tools.gi.autogen.jl" );

#= comment for Julia
include( "gap/precompiled_categories/CategoryOfSkeletalFinSetsPrecompiled.gi.autogen.jl" );
# =#

include( "gap/FinSetsForCAP.gi.autogen.jl" );

include( "gap/SkeletalFinSetsForCAP.gi.autogen.jl" );

#= comment for Julia
if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    # COVERAGE_IGNORE_NEXT_LINE
    include( "gap/Julia.gi.autogen.jl" );
fi;
# =#
