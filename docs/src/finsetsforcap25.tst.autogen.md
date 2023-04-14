
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> Display( SubobjectClassifier( FinSets ) )
[ "true", "false" ]

julia> Display( TruthMorphismOfTrue( FinSets ) )
[ [ [ ] ], [ [ [ ], "true" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfFalse( FinSets ) )
[ [ [ ] ], [ [ [ ], "false" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfNot( FinSets ) )
[ [ "true", "false" ], [ [ "false", "true" ], [ "true", "false" ] ], [ "true", "false" ] ]

julia> Display( CartesianSquareOfSubobjectClassifier( FinSets ) )
[ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ]

julia> Display( TruthMorphismOfAnd( FinSets ) )
[ [ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ], [ [ [ "false", "false" ], "false" ], [ [ "false", "true" ], "false" ], [ [ "true", "false" ], "false" ], [ [ "true", "true" ], "true" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfOr( FinSets ) )
[ [ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ], [ [ [ "false", "false" ], "false" ], [ [ "false", "true" ], "true" ], [ [ "true", "false" ], "true" ], [ [ "true", "true" ], "true" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfImplies( FinSets ) )
[ [ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ], [ [ [ "false", "false" ], "true" ], [ [ "false", "true" ], "true" ], [ [ "true", "false" ], "false" ], [ [ "true", "true" ], "true" ] ], [ "true", "false" ] ]

julia> S = FinSet( [ 1, 2, 3, 4, 5 ] )
<An object in FinSets>

julia> A = FinSet( [ 1, 5 ] )
<An object in FinSets>

julia> m = EmbeddingOfFinSets( A, S )
<A morphism in FinSets>

julia> Display( ClassifyingMorphismOfSubobject( m ) )
[ [ 1, 2, 3, 4, 5 ], [ [ 1, "true" ], [ 2, "false" ], [ 3, "false" ], [ 4, "false" ], [ 5, "true" ] ], [ "true", "false" ] ]

```
