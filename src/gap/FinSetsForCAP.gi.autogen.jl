# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( @__MODULE__,  CategoryOfFinSets,
               [ ],
               
  function ( )
    local FinSets;
    
    FinSets = CreateCapCategory( "FinSets", IsCategoryOfFinSets, IsFiniteSet, IsFiniteSetMap, IsCapCategoryTwoCell );
    
    FinSets.category_as_first_argument = true;
    
    FinSets.supports_empty_limits = true;
    
    FinSets.compiler_hints = rec(
        category_filter = IsCategoryOfFinSets,
        object_filter = IsFiniteSet,
        morphism_filter = IsFiniteSetMap,
    );
    
    #= comment for Julia
    SetIsElementaryTopos( FinSets, true );
    # =#
    
    INSTALL_FUNCTIONS_FOR_FIN_SETS( FinSets );
    
    #= comment for Julia
    AddTheoremFileToCategory( FinSets,
            Filename( DirectoriesPackageLibrary( "Toposes", "LogicForToposes" ), "PropositionsForToposes.tex" ) );
    # =#
    
    Finalize( FinSets );
    
    return FinSets;
    
end );


##
InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two integers",
        [ IsInt, IsInt ],
        
  ( int1, int2 ) -> int1 == int2 );

InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two chars",
        [ IsChar, IsChar ],
        
  ( char1, char2 ) -> char1 == char2 );

InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two strings",
        [ IsString, IsString ],
        
  ( string1, string2 ) -> string1 == string2 );

InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two objects",
        [ IsObject, IsObject ],
        
  IsIdenticalObj );

InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two lists",
        [ IsList, IsList ],
        
  function ( L1, L2 )
    local i;
    
    # compare lists recursively

    if Length( L1 ) != Length( L2 )
        return false;
    end;

    for i in (1):(Length( L1 ))
        if IsBound( L1[i] ) != IsBound( L2[i] )
            return false;
        end;
        
        if IsBound( L1[i] )
            if !IsEqualForElementsOfFinSets( L1[i], L2[i] )
                return false;
            end;
        end;
    end;
    
    return true;
    
end );

InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two records",
        [ IsRecord, IsRecord ],
        
  function ( a, b )
    local i;
    
    # compare records recursively

    if RecNames( a ) != RecNames( b )
        return false;
    end;
    
    for i in RecNames( a )
        if !IsEqualForElementsOfFinSets( a[i], b[i] )
            return false;
        end;
    end;
    
    return true;
    
end );

InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two CAP category objects",
        [ IsCapCategoryObject, IsCapCategoryObject ],
        
  function ( a, b )
    # compare CAP category objects using IsEqualForObjects (if available)
    
    if HasCapCategory( a ) && HasCapCategory( b ) && ApplicableMethod( IsEqualForObjects, [ a, b ] ) != fail
        return IsIdenticalObj( CapCategory( a ), CapCategory( b ) ) && IsEqualForObjects( a, b );
    end;
    
    # COVERAGE_IGNORE_NEXT_LINE
    TryNextMethod();
    
end );

InstallMethod( @__MODULE__,  IsEqualForElementsOfFinSets,
        "for two CAP category morphisms",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function ( a, b )
    # compare CAP category objects using IsEqualForMorphisms (if available)
    
    if HasCapCategory( a ) && HasCapCategory( b ) && ApplicableMethod( IsEqualForMorphismsOnMor, [ a, b ] ) != fail
        return IsIdenticalObj( CapCategory( a ), CapCategory( b ) ) && IsEqualForMorphismsOnMor( a, b );
    end;
    
    # COVERAGE_IGNORE_NEXT_LINE
    TryNextMethod();
    
end );

##
InstallMethod( @__MODULE__,  FinSetNC,
        "for a category of finite sets && a list",
        [ IsCategoryOfFinSets, IsList ],
        
  function ( category_of_finite_sets, L )
    local set, i;
    
    set = CreateCapCategoryObjectWithAttributes( category_of_finite_sets,
            AsList, L,
            Length, Length( L )
            );
    
    Assert( 4, IsWellDefined( set ) );

    for i in (1):(Length( L ))
        if IsBound( L[i] ) && !IsEqualForElementsOfFinSets( L[i], AsList( set )[i] )
            # COVERAGE_IGNORE_BLOCK_START
            Display( "Warning: The elements of the list passed to the constructor are !equal (w.r.t. IsEqualForElementsOfFinSets) to the elements of the resulting FinSet. Either pass an immutable copy of the list || add an additional special case to IsEqualForElementsOfFinSets to avoid this warning." );
            break;
            # COVERAGE_IGNORE_BLOCK_END
        end;
    end;

    return set;
    
end );

##
InstallOtherMethod( FinSet,
        "for a category of finite sets && a list",
        [ IsCategoryOfFinSets, IsList ],
        
  function ( category_of_finite_sets, L )
    
    return FinSetNC( category_of_finite_sets, Set( L ) );
    
end );

##
InstallMethod( @__MODULE__,  in,
        "for an object && a CAP finite set",
        [ IsObject, IsFiniteSet ],
        
  function ( y, M )
    
    return ForAny( AsList( M ), m -> IsEqualForElementsOfFinSets( m, y ) );
    
end );

##
InstallMethod( @__MODULE__,  getindex,
        "for CAP finite sets",
        [ IsFiniteSet, IsInt ],

  function ( M, i )
    
    return AsList( M )[i];
    
end );

##
InstallMethod( @__MODULE__,  Iterator,
        "for CAP finite sets",
        [ IsFiniteSet ],

  function ( M )
    
    return Iterator( AsList( M ) );
    
end );

##
InstallMethod( @__MODULE__,  UnionOfFinSets,
        "for a category of finite sets && a list of CAP finite sets",
        [ IsCategoryOfFinSets, IsList ],
        
  function ( category_of_finite_sets, L )
    local union, M, m;
    
    union = FinSet( category_of_finite_sets, [ ] );
    for M in L
        for m in M
            if !m ??? union
                union = ShallowCopy( AsList( union ) );
                Add( union, m );
                union = FinSetNC( category_of_finite_sets, union );
            end;
        end;
    end;
    
    return union;
    
end );

##
InstallMethod( @__MODULE__,  ListOp,
        "for a CAP finite set && a function",
        [ IsFiniteSet, IsFunction ],
        
  function ( M, f )
    
    return List( AsList( M ), f );
    
end );

##
InstallMethod( @__MODULE__,  FilteredOp,
        "for a CAP finite set && a function",
        [ IsFiniteSet, IsFunction ],
        
  function ( M, f )
    
    return FinSetNC( CapCategory( M ), Filtered( AsList( M ), f ) );
    
end );

##
InstallMethod( @__MODULE__,  FirstOp,
        "for a CAP finite set && a function",
        [ IsFiniteSet, IsFunction ],
        
  function ( M, f )
    
    return First( AsList( M ), f );
    
end );

##
InstallMethod( @__MODULE__,  MapOfFinSets,
        "for two CAP finite sets && a list",
        [ IsFiniteSet, IsList, IsFiniteSet ],
        
  function ( S, G, T )
    
    return MapOfFinSetsNC( S, Set( G ), T );
    
end );

##
InstallMethod( @__MODULE__,  MapOfFinSetsNC,
        "for a two CAP finite sets && a list",
        [ IsFiniteSet, IsList, IsFiniteSet ],
        
  function ( S, G, T )
    local map;
    
    map = CreateCapCategoryMorphismWithAttributes( CapCategory( S ),
            S,
            T,
            AsList, G
            );
    
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallMethod( @__MODULE__,  EmbeddingOfFinSets,
        "for a two CAP finite sets",
        [ IsFiniteSet, IsFiniteSet ],
        
  function ( S, T )
    local iota;
    
    iota = MapOfFinSetsNC( S, List( S, x -> [ x, x ] ), T );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( @__MODULE__,  ProjectionOfFinSets,
        "for a two CAP finite sets",
        [ IsFiniteSet, IsFiniteSet ],
        
  function ( S, T )
    local pi;
    
    pi = MapOfFinSetsNC( S, List( S, x -> [ x, First( T, t -> x ??? t ) ] ), T );
    
    Assert( 3, IsEpimorphism( pi ) );
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
InstallMethod( @__MODULE__,  Preimage,
        "for a CAP map of finite sets && a CAP finite set",
        [ IsFiniteSetMap, IsFiniteSet ],
        
  function ( f, T_ )
    
    return Filtered( Source( f ), x -> f(x) ??? T_ );
    
end );

##
InstallMethod( @__MODULE__,  ImageObject,
        "for a CAP map of finite sets && a CAP finite set",
        [ IsFiniteSetMap, IsFiniteSet ],
        
  function ( f, S_ )
    
    return ImageObject( PreCompose( EmbeddingOfFinSets( S_, Source( f ) ), f ) );
    
end );

##
InstallMethod( @__MODULE__,  CallFuncList,
        "for a CAP map of finite sets && a list",
        [ IsFiniteSetMap, IsList ],
        
  function ( phi, L )
    local x, y;
    
    x = L[1];
    
    y = First( AsList( phi ), pair -> IsEqualForElementsOfFinSets( pair[1], x ) );
    
    if y == fail
        # COVERAGE_IGNORE_BLOCK_START
        if HasIsWellDefined( phi )
            if IsWellDefined( phi )
                Error( "the element ", x, " is !in the source of the map\n" );
            else
                if !x ??? Source( phi )
                    Error( "the element ", x, " is !in the source of the map\n" );
                else
                    Error( "the element ", x, " is ??? the source of the map, however, the map is !well-defined\n" );
                end;
            end;
        else
            Error( "the element ", x, " may !be ??? the source of the map, please check if the map is well-defined\n" );
        end;
        # COVERAGE_IGNORE_BLOCK_END
    end;
    
    return y[2];
    
end );

##
InstallMethod( @__MODULE__,  ListOp,
        "for a CAP finite set && a CAP map of finite sets",
        [ IsFiniteSet, IsFiniteSetMap ],
        
  function ( F, phi )
    
    return List( AsList( F ), phi );
    
end );

##
@InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_FIN_SETS,
    function ( category_of_finite_sets )

##
AddObjectConstructor( category_of_finite_sets,
  function ( category_of_finite_sets, set )
    
    return FinSetNC( category_of_finite_sets, set );
    
end );

##
AddObjectDatum( category_of_finite_sets,
  function ( category_of_finite_sets, set )
    
    return AsList( set );
    
end );

##
AddMorphismConstructor( category_of_finite_sets,
  function ( category_of_finite_sets, source, map, range )
    
    return MapOfFinSets( source, map, range );
    
end );

##
AddMorphismDatum( category_of_finite_sets,
  function ( category_of_finite_sets, map )
    
    return AsList( map );
    
end );

##
AddIsWellDefinedForObjects( category_of_finite_sets,
  function ( category_of_finite_sets, set )
    local L, i, j;
    
    L = AsList( set );
    
    if !IsDenseList( L )
        return false;
    end;
    
    for i in (1):(Length( L ))
        for j in (1):(( i - 1 ))
            if IsEqualForElementsOfFinSets( L[i], L[j] )
                return false;
            end;
        end;
    end;
    
    return true;
  
end );

##
AddIsWellDefinedForMorphisms( category_of_finite_sets,
  function ( category_of_finite_sets, mor )
    local S, T, rel, i, j;
    
    S = Source( mor );
    T = Range( mor );
    
    rel = AsList( mor );
    
    if !IsDenseList( rel )
        return false;
    end;
    
    if !Length( S ) == Length( rel )
        return false;
    end;
    
    if !ForAll( rel, a -> IsList( a ) && Length( a ) == 2 && a[1] ??? S && a[ 2 ] ??? T )
        return false;
    end;
    
    for i in (1):(Length( rel ))
        for j in (1):(( i - 1 ))
            if IsEqualForElementsOfFinSets( rel[i][1], rel[j][1] )
                return false;
            end;
        end;
    end;

    # since Length( S ) == Length( rel ) && the list of first components of rel is duplicate free, any element ??? S has to appear as a first component ??? rel
    
    return true;
    
end );

##
AddIsEqualForObjects( category_of_finite_sets,
  function ( category_of_finite_sets, set1, set2 )
    if !Length( set1 ) == Length( set2 )
        return false;
    end;
    
    return IsEqualForElementsOfFinSets( AsList( set1 ), AsList( set2 ) );
    
end );

##
AddIsEqualForMorphisms( category_of_finite_sets,
  function ( category_of_finite_sets, map1, map2 )
    local S;
    
    S = Source( map1 );
    
    # if map1 && map2 are well-defined, then Length( AsList( map1 ) ) == Length( AsList( S ) ) == Length( AsList( map2 ) )
    
    return ForAll( AsList( S ), s -> IsEqualForElementsOfFinSets( map1( s ), map2( s ) ) );
    
end );

##
AddIsHomSetInhabited( category_of_finite_sets,
  function ( category_of_finite_sets, A, B )
    
    return IsInitial( A ) || !IsInitial( B );
    
end );

##
AddIdentityMorphism( category_of_finite_sets,
  function ( category_of_finite_sets, set )
    
    return MapOfFinSetsNC( set, List( set, e -> [ e, e ] ), set );
    
end );

##
AddPreCompose( category_of_finite_sets,
  function ( category_of_finite_sets, map_pre, map_post )
    local S, cmp;
    
    S = Source( map_pre );
    
    cmp = List( S, s -> [ s, map_post( map_pre( s ) ) ] );
    
    return MapOfFinSetsNC( S, cmp, Range( map_post ) );
    
end );

##
AddIsTerminal( category_of_finite_sets,
  function ( category_of_finite_sets, M )
    
    return Length( M ) == 1;
    
end );

##
AddTerminalObject( category_of_finite_sets,
  function ( category_of_finite_sets )
    
    # the terminal object consists of the empty list to coincide with the empty direct product
    return FinSetNC( category_of_finite_sets, [ [ ] ] );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( category_of_finite_sets,
  function ( category_of_finite_sets, M, T )
    local t;
    
    t = AsList( T );
    
    t = t[1];
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, t ] ), T );
    
end );

##
AddDirectProduct( category_of_finite_sets,
  function ( category_of_finite_sets, L )
    
    return FinSetNC( category_of_finite_sets, List( Cartesian( List( Reversed( L ), AsList ) ), Reversed ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( category_of_finite_sets,
  function ( category_of_finite_sets, L, i, S )
    local T, Graph;
    
    T = L[i];
    
    Graph = List( S, x -> [ x, x[i] ] );
    
    return MapOfFinSetsNC( S, Graph, T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( category_of_finite_sets,
  function ( category_of_finite_sets, D, test_object, tau, T )
    local Graph;
    
    Graph = List( AsList( test_object ), x -> [ x, List( tau, f -> f(x) ) ] );
    
    return MapOfFinSetsNC( test_object, Graph, T );
    
end );

##
AddIsInitial( category_of_finite_sets,
  function ( category_of_finite_sets, M )
    
    return Length( M ) == 0;
    
end );

##
AddInitialObject( category_of_finite_sets,
  function ( category_of_finite_sets )
    
    return FinSetNC( category_of_finite_sets, [ ] );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( category_of_finite_sets,
  function ( category_of_finite_sets, M, I )
    
    return MapOfFinSetsNC( I, [ ], M );
    
end );

##
AddIsProjective( category_of_finite_sets,
  ( category_of_finite_sets, M ) -> true );

##
AddEpimorphismFromSomeProjectiveObject( category_of_finite_sets,
  ( category_of_finite_sets, M ) -> IdentityMorphism( category_of_finite_sets, M ) );

##
AddIsInjective( category_of_finite_sets,
  function ( category_of_finite_sets, M )
    
    return !IsInitial( M );
    
end );

##
AddMonomorphismIntoSomeInjectiveObject( category_of_finite_sets,
  function ( category_of_finite_sets, M )
    
    if IsInitial( M )
        return UniversalMorphismIntoTerminalObject( M );
    end;
    
    return IdentityMorphism( M );
    
end );

##
AddCoproduct( category_of_finite_sets,
  function ( category_of_finite_sets, L )
    
    L = List( (1):(Length( L )), i -> Cartesian( [i], AsList( L[i] ) ) );
    
    return FinSetNC( category_of_finite_sets, Concatenation( L ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( category_of_finite_sets,
  function ( category_of_finite_sets, L, i, T )
    local S;
    
    S = L[i];
    
    return MapOfFinSetsNC( S, List( S, x -> [ x, [ i, x ] ] ), T );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( category_of_finite_sets,
  function ( category_of_finite_sets, D, test_object, tau, S )
    
    return MapOfFinSetsNC( S, List( S, i_x -> [ i_x, tau[i_x[1]]( i_x[2] ) ] ), test_object );
    
end );

##
AddImageObject( category_of_finite_sets,
  function ( category_of_finite_sets, phi )
    local S, T, I, s;
    
    S = Source( phi );
    T = Range( phi );

    I = FinSetNC( category_of_finite_sets, [ ] );
    for s in S
        if !phi( s ) ??? I
            I = ShallowCopy( AsList( I ) );
            Add( I, phi( s ) );
            I = FinSetNC( category_of_finite_sets, I );
        end;
    end;
    
    return I;
    
end );

##
AddIsEpimorphism( category_of_finite_sets,
  function ( category_of_finite_sets, phi )
    
    return Length( ImageObject( phi ) ) == Length( Range( phi ) );
    
end );

##
AddIsSplitEpimorphism( category_of_finite_sets,
  ( category_of_finite_sets, phi ) -> IsEpimorphism( category_of_finite_sets, phi ) );

##
AddIsMonomorphism( category_of_finite_sets,
  function ( category_of_finite_sets, phi )
    
    return Length( ImageObject( phi ) ) == Length( Source( phi ) );
    
end );

##
AddIsSplitMonomorphism( category_of_finite_sets,
  function ( category_of_finite_sets, phi )
    return IsInitial( Range( phi ) ) || ( !IsInitial( Source( phi ) ) && IsMonomorphism( phi ) );
end );

##
AddIsLiftable( category_of_finite_sets,
  function ( category_of_finite_sets, beta, alpha )
    
    return IsSubset( AsList( ImageObject( alpha ) ), AsList( ImageObject( beta ) ) );
    
end );

##
AddLift( category_of_finite_sets,
  function ( category_of_finite_sets, beta, alpha )
    local chi;
    
    chi = List( AsList( beta ),
                 pair -> [ pair[1], Preimage( alpha, FinSet( category_of_finite_sets, [ pair[2] ] ) )[1] ] );
    
    return MapOfFinSetsNC( Source( beta ), chi, Source( alpha ) );
    
end );

##
AddImageEmbedding( category_of_finite_sets,
  function ( category_of_finite_sets, phi )
    local I;
    
    I = ImageObject( phi );
    
    return MapOfFinSetsNC( I, List( I, e -> [ e, e ] ), Range( phi ) );
    
end );

##
AddCoastrictionToImage( category_of_finite_sets,
  function ( category_of_finite_sets, phi )
    local pi;
    
    pi = MapOfFinSetsNC( Source( phi ), AsList( phi ), ImageObject( phi ) );
    
    Assert( 3, IsEpimorphism( pi ) );
    
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
AddEqualizer( category_of_finite_sets,
  function ( category_of_finite_sets, S, D )
    
    return Filtered( S, x -> ForAll( (1):(Length( D ) - 1), j -> IsEqualForElementsOfFinSets( D[j]( x ), D[j + 1]( x ) ) ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( category_of_finite_sets,
  function ( category_of_finite_sets, S, D, E )
    
    return EmbeddingOfFinSets( E, S );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( category_of_finite_sets,
  function ( category_of_finite_sets, S, D, test_object, tau, E )
    
    return MapOfFinSetsNC( Source( tau ), AsList( tau ), E );
    
end );

##
AddCoequalizer( category_of_finite_sets,
  function ( category_of_finite_sets, T, D )
    local C, images, previousImages, preimages;
    
    T = AsList( T );
    
    C = [ ];
    
    while !IsEmpty( T )
        images = FinSetNC( category_of_finite_sets, [ T[1] ] );
        previousImages = FinSetNC( category_of_finite_sets, [ ] );
        while previousImages != images
            previousImages = images;
            preimages = UnionOfFinSets( category_of_finite_sets, List( D, f_i -> Preimage( f_i, images ) ) );
            if Length( preimages ) > 0
                images = UnionOfFinSets( category_of_finite_sets, List( D, f_j -> ImageObject( f_j, preimages ) ) );
            end;
        end;
        
        Add( C, AsList( images ) );
        T = Filtered( T, t -> !t ??? images );
    end;

    return FinSetNC( category_of_finite_sets, C );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( category_of_finite_sets,
  function ( category_of_finite_sets, T, D, C )
    
    return ProjectionOfFinSets( T, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( category_of_finite_sets,
  function ( category_of_finite_sets, T, D, test_object, tau, C )
    local G;
    
    G = List( C, x -> [ x, tau( x[1] ) ] );
    
    return MapOfFinSetsNC( C, G, Range( tau ) );
    
end );

## The cartesian monoidal structure
#= comment for Julia

##
AddCartesianLeftUnitorWithGivenDirectProduct( category_of_finite_sets,
  function ( category_of_finite_sets, M, TM )
    
    return MapOfFinSetsNC( TM, List( TM, x -> [ x, x[2] ] ), M );
    
end );

##
AddCartesianLeftUnitorInverseWithGivenDirectProduct( category_of_finite_sets,
  function ( category_of_finite_sets, M, TM )
    
    return MapOfFinSetsNC( M, List( TM, x -> [ x[2], x ] ), TM );
    
end );

##
AddCartesianRightUnitorWithGivenDirectProduct( category_of_finite_sets,
  function ( category_of_finite_sets, M, MT )
    
    return MapOfFinSetsNC( MT, List( MT, x -> [ x, x[1] ] ), M );
    
end );

##
AddCartesianRightUnitorInverseWithGivenDirectProduct( category_of_finite_sets,
  function ( category_of_finite_sets, M, MT )
    
    return MapOfFinSetsNC( M, List( MT, x -> [ x[1], x ] ), MT );
    
end );

##
AddCartesianBraidingWithGivenDirectProducts( category_of_finite_sets,
  function ( category_of_finite_sets, MN, M, N, NM )
    
    return MapOfFinSetsNC( MN, List( MN, x -> [ x, x[[2,1]] ] ), NM );
    
end );

##
AddCartesianBraidingInverseWithGivenDirectProducts( category_of_finite_sets,
  function ( category_of_finite_sets, NM, M, N, MN )
    
    return MapOfFinSetsNC( NM, List( NM, x -> [ x, x[[2,1]] ] ), MN );
    
end );

##
AddExponentialOnObjects( category_of_finite_sets,
  function ( category_of_finite_sets, M, N )
    local m;
    
    m = Length( M );
    
    return FinSetNC( category_of_finite_sets, List( List( TuplesK( AsList( N ), m, [ ], 1 ), Reversed ), L -> MapOfFinSetsNC( M, List( (1):(m), i -> [ M[i], L[i] ] ), N ) ) );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( category_of_finite_sets,
  function ( category_of_finite_sets, S, alpha, beta, T )
    
    return MapOfFinSetsNC( S, List( S, f -> [ f, PreCompose( [ alpha, f, beta ] ) ] ), T );
    
end );

##
AddCartesianEvaluationMorphismWithGivenSource( category_of_finite_sets,
  function ( category_of_finite_sets, M, N, HM_NxM )
    
    return MapOfFinSetsNC( HM_NxM, List( HM_NxM, fx -> [ fx, fx[1](fx[2]) ] ), N );
    
end );

##
AddCartesianCoevaluationMorphismWithGivenRange( category_of_finite_sets,
  function ( category_of_finite_sets, M, N, HN_MxN )
    local MN;
    
    MN = DirectProduct( M, N );
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, MapOfFinSetsNC( N, List( N, y -> [ y, [ x, y ] ] ), MN ) ] ), HN_MxN );
    
end );

##
AddDirectProductToExponentialAdjunctionMap( category_of_finite_sets,
  function ( category_of_finite_sets, M, N, f )
    local L;
    
    L = Range( f );
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, MapOfFinSetsNC( N, List( N, y -> [ y, f( [ x, y ] ) ] ), L ) ] ), ExponentialOnObjects( N, L ) );
    
end );

##
AddExponentialToDirectProductAdjunctionMap( category_of_finite_sets,
  function ( category_of_finite_sets, N, L, g )
    local M, MN;
    
    M = Source( g );
    
    MN = DirectProduct( M, N );
    
    return MapOfFinSetsNC( MN, List( MN, xy -> [ xy, g( xy[1] )( xy[2] ) ] ), L );
    
end );

##
AddCartesianPreComposeMorphismWithGivenObjects( category_of_finite_sets,
  function ( category_of_finite_sets, HM_NxH_N_L, M, N, L, HM_L )
    
    return MapOfFinSetsNC( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PreCompose( fg[1], fg[2] ) ] ), HM_L );
    
end );

##
AddCartesianPostComposeMorphismWithGivenObjects( category_of_finite_sets,
  function ( category_of_finite_sets, HM_NxH_N_L, M, N, L, HM_L )
    
    return MapOfFinSetsNC( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PostCompose( fg[1], fg[2] ) ] ), HM_L );
    
end );

##
AddDirectProductExponentialCompatibilityMorphismWithGivenObjects( category_of_finite_sets,
  function ( category_of_finite_sets, source, L, range )
    local S1S2, T1T2;
    
    S1S2 = DirectProduct( L[[ 1, 3 ]] );
    T1T2 = DirectProduct( L[[ 2, 4 ]] );
    
    return MapOfFinSetsNC( source, List( source, fg -> [ fg, DirectProductOnMorphismsWithGivenDirectProducts( S1S2, fg[1], fg[2], T1T2 ) ] ), range );
    
end );

##
AddCartesianLambdaIntroduction( category_of_finite_sets,
  function ( category_of_finite_sets, map )
    local I;
    
    I = TerminalObject( category_of_finite_sets );
    
    return MapOfFinSetsNC(
                   I,
                   [ [ AsList( I )[1], map ] ],
                   ExponentialOnObjects( Source( map ), Range( map ) ) );
    
end );

##
AddSubobjectClassifier( category_of_finite_sets,
  function ( category_of_finite_sets )
      
      return FinSetNC( category_of_finite_sets, [ "true", "false" ] );
      
end );

##
AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( category_of_finite_sets,
  function ( category_of_finite_sets, monomorphism, Omega )
    local range, images;
    
    range = Range( monomorphism );
    
    images = List( range,
                    function ( x )
                      
                      if x ??? ImageObject( monomorphism )
                          return [ x, "true" ];
                      end;
                      
                      return [ x, "false" ];
                      
                  end );
      
      return MapOfFinSets( range, images, Omega );
      
end );
# =#

end );

##
InstallMethod( @__MODULE__,  ViewObj,
        "for a CAP finite set",
        [ IsFiniteSet ],
        
  function ( S )
    Print( "<An object ??? ", Name( CapCategory( S ) ), ">" );
end );

##
InstallMethod( @__MODULE__,  Display,
        "for a CAP finite set",
        [ IsFiniteSet ],
        
  function ( S )
    Print( AsList( S ), "\n" );
end );

##
InstallMethod( @__MODULE__,  Display,
        "for a CAP map of finite sets",
        [ IsFiniteSetMap ],
        
  function ( phi )
    Print( [ AsList( Source( phi ) ), AsList( phi ), AsList( Range( phi ) ) ], "\n" );
end );

##
InstallMethod( @__MODULE__,  FinSetNC,
        "for a list",
        [ IsList ],
        
  function ( L )
    return FinSetNC( FinSets, L );
end );

##
InstallOtherMethod( FinSet,
        "for a list",
        [ IsList ],
        
  function ( L )
    return FinSet( FinSets, L );
end );
