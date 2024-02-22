module FinSetsForCAP

@nospecialize

import Base.in
import Base.getindex
import Base.iterate

using CAP

import CAP.ImageObject_OPERATION
import CAP.CallFuncList
import CAP.DisplayString
import CAP.ViewString
import CAP.PrintString
import CAP.StringGAP_OPERATION
import CAP.ListOp
import CAP.FilteredOp
import CAP.First

using CartesianCategories

using Toposes

include("init.jl")

# Iterator in FinSets
function iterate(M::IsObjectInCategoryOfFiniteSets.abstract_type)
	iterate( AsList( M ) )
end

function iterate(M::IsObjectInCategoryOfFiniteSets.abstract_type, state)
	iterate( AsList( M ), state )
end

# CallFuncList in FinSets
function (phi::IsMorphismInCategoryOfFiniteSets.abstract_type)(x)
	CallFuncList( phi, [ x ] )
end

# convenience converting Int to BigInt in SkeletalFinSets

##
function FinSet(n::Int)
    FinSet(BigInt(n));
end

##
function MapOfFinSets(s::IsObjectInSkeletalCategoryOfFiniteSets.abstract_type, G::Vector{Int}, t::IsObjectInSkeletalCategoryOfFiniteSets.abstract_type)
	MapOfFinSets( s, Vector{BigInt}(G), t );
end

function MapOfFinSets(s::IsObjectInSkeletalCategoryOfFiniteSets.abstract_type, G::UnitRange{Int}, t::IsObjectInSkeletalCategoryOfFiniteSets.abstract_type)
	MapOfFinSets( s, UnitRange{BigInt}(G), t );
end

function MapOfFinSets(s::IsObjectInSkeletalCategoryOfFiniteSets.abstract_type, G::StepRange{Int}, t::IsObjectInSkeletalCategoryOfFiniteSets.abstract_type)
	MapOfFinSets( s, StepRange{BigInt}(G), t );
end

# CallFuncList in SkeletalFinSets
function (phi::IsMorphismInSkeletalCategoryOfFiniteSets.abstract_type)(x)
	CallFuncList( phi, [ x ] )
end

end # module FinSetsForCAP
