
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> SubobjectClassifier( SkeletalFinSets )
|2|

julia> Display( TruthMorphismOfFalse( SkeletalFinSets ) )
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfTrue( SkeletalFinSets ) )
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfNot( SkeletalFinSets ) )
[ 0, 1 ] ⱶ[ 1, 0 ]→ [ 0, 1 ]

julia> CartesianSquareOfSubobjectClassifier( SkeletalFinSets )
|4|

julia> Display( TruthMorphismOfAnd( SkeletalFinSets ) )
[ 0,..., 3 ] ⱶ[ 0, 0, 0, 1 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfOr( SkeletalFinSets ) )
[ 0,..., 3 ] ⱶ[ 0, 1, 1, 1 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfImplies( SkeletalFinSets ) )
[ 0,..., 3 ] ⱶ[ 1, 0, 1, 1 ]→ [ 0, 1 ]

julia> S = FinSet( 5 )
|5|

julia> A = FinSet( 2 )
|2|

julia> m = MapOfFinSets( A, [ 0, 4 ], S )
|2| → |5|

julia> Display( ClassifyingMorphismOfSubobject( m ) )
[ 0,..., 4 ] ⱶ[ 1, 0, 0, 0, 1 ]→ [ 0, 1 ]

```
