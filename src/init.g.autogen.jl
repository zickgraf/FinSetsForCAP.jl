# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Reading the declaration part of the package.
#

include( "gap/Tools.gd.autogen.jl" );

include( "gap/FinSetsForCAP.gd.autogen.jl" );

include( "gap/SkeletalFinSetsForCAP.gd.autogen.jl" );

#= comment for Julia
if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    # COVERAGE_IGNORE_NEXT_LINE
    include( "gap/Julia.gd.autogen.jl" );
fi;
# =#
