# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( @__MODULE__,  CategoryOfSkeletalFinSets,
               [ ],
               
  function ( )
    local cat;
    
    cat = CreateCapCategory( "SkeletalFinSets", IsCategoryOfSkeletalFinSets, IsSkeletalFiniteSet, IsSkeletalFiniteSetMap, IsCapCategoryTwoCell );
    
    cat.category_as_first_argument = true;
    
    cat.supports_empty_limits = true;
    
    cat.compiler_hints = rec(
        category_filter = IsCategoryOfSkeletalFinSets,
        object_filter = IsSkeletalFiniteSet,
        morphism_filter = IsSkeletalFiniteSetMap,
    );
    
    # this is a workhorse category -> no logic && caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( cat );
    
    SetIsSkeletalCategory( cat, true );
    
    #= comment for Julia
    SetIsElementaryTopos( cat, true );
    # =#
    
    INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS( cat );
    
    #= comment for Julia
    AddTheoremFileToCategory( cat,
            Filename( DirectoriesPackageLibrary( "Toposes", "LogicForToposes" ), "PropositionsForToposes.tex" ) );
    # =#
    
    if ValueOption( "no_precompiled_code" ) != true
        
        #= comment for Julia
        ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsPrecompiled( cat );
        # =#
        
    end;
    
    Finalize( cat );
    
    return cat;
    
end );

##
InstallMethod( @__MODULE__,  FinSetOp,
        [ IsCategoryOfSkeletalFinSets, IsInt ],
        
  function ( cat, n )
    local int;
    
    int = CreateCapCategoryObjectWithAttributes( cat, Length, n );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
InstallMethod( @__MODULE__,  AsList,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    
    return (0):(Length( s ) - 1);
    
end );

##
InstallMethod( @__MODULE__,  ListOp,
        "for a CAP skeletal finite set && a function",
        [ IsSkeletalFiniteSet, IsFunction ],
        
  function ( s, f )
    
    return List( AsList( s ), x -> f(x) );
    
end );

## Morphisms

##
InstallMethod( @__MODULE__,  MapOfFinSets,
        "for two CAP skeletal finite sets && a list",
        [ IsSkeletalFiniteSet, IsList, IsSkeletalFiniteSet ],
        
  function ( s, G, t )
    
    return MapOfFinSets( CapCategory( s ), s, G, t );
    
end );

##
InstallOtherMethodForCompilerForCAP( MapOfFinSets,
        "for a category of skeletal finite sets, two CAP skeletal finite sets && a list",
        [ IsCategoryOfSkeletalFinSets, IsSkeletalFiniteSet, IsList, IsSkeletalFiniteSet ],
        
  function ( cat, s, G, t )
    local map;
    
    map = CreateCapCategoryMorphismWithAttributes( cat,
            s,
            t,
            AsList, G );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallMethod( @__MODULE__,  EmbeddingOfFinSets,
        "for two CAP skeletal finite sets",
        [ IsSkeletalFiniteSet, IsSkeletalFiniteSet ],
        
  function ( s, t )
    local iota;
    
    iota = MapOfFinSets( s, AsList( s ), t );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( @__MODULE__,  Preimage,
        "for a CAP map of skeletal finite sets && a CAP skeletal finite set",
        [ IsSkeletalFiniteSetMap, IsList ],
        
  function ( phi, t )
    local S;
    
    S = AsList( Source( phi ) );
    
    phi = AsList( phi );
    
    return Filtered( S, i -> phi[1 + i] ??? t );
    
end );

##
InstallMethod( @__MODULE__,  ImageObject,
     "for a CAP map of skeletal finite sets && a CAP skeletal finite set",
     [ IsSkeletalFiniteSetMap, IsSkeletalFiniteSet ],
      function ( phi, s_ )

    return ImageObject( PreCompose( EmbeddingOfFinSets( s_, Source( phi ) ), phi ) );

end );

##
InstallMethod( @__MODULE__,  CallFuncList,
        "for a CAP map of skeletal finite sets && a list",
    [ IsSkeletalFiniteSetMap, IsList ],
        
  function ( phi, L )
    local x;
    
    x = L[1];
    
    return AsList( phi )[1 + x];
    
end );

##
@InstallGlobalFunction( SKELETAL_FIN_SETS_ExplicitCoequalizer,
  function ( s, D )
    local T, Cq, t, L, i;
    
    T = AsList( s );
    
    Cq = [ ];
    
    while !IsEmpty( T )
        t = T[1];
        t = Union( List( D, f_j -> List( Union( List( D, f_i -> Preimage( f_i, [ t ] ) ) ), f_j ) ) );
        t = AsList( t );
        if IsEmpty( t )
            t = [ T[1] ];
        end;
        Add( Cq, t );
        T = Difference( T, t );
    end;
    
    T = AsList( s );
    
    if Concatenation( Cq ) != T
        for t in T
            L = [ ];
            for i in (1):(Length( Cq ))
                if t ??? Cq[i]
                    Add( L, Cq[i] );
                end;
            end;
            if Length( L ) > 1
                Cq = Difference( Cq, L );
                Add( Cq, Set( Concatenation( L ) ) );
            end;
        end;
    end;
    
    return Set( Cq );

end );

##
@InstallGlobalFunction( SKELETAL_FIN_SETS_IsEpimorphism,
  function ( imgs, t )
    local testList, img;
    
    testList = ListWithIdenticalEntries( t, false );
    
    for img in imgs
        testList[1 + img] = true;
    end;
    
    return testList;
    
end );

##
@InstallGlobalFunction( SKELETAL_FIN_SETS_IsMonomorphism,
  function ( imgs, t )
    local testList, img;
    
    testList = ListWithIdenticalEntries( t, false );
    
    for img in imgs
        if testList[1 + img]
            return false;
        end;
        testList[1 + img] = true;
    end;
    
    return true;
    
end );

##
@InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS,
  function ( SkeletalFinSets )
    
##
AddObjectConstructor( SkeletalFinSets,
  function ( SkeletalFinSets, n )
    
    return FinSet( SkeletalFinSets, n );
    
end );

##
AddObjectDatum( SkeletalFinSets,
  function ( SkeletalFinSets, n )
    
    return Length( n );
    
end );

##
AddMorphismConstructor( SkeletalFinSets,
  function ( SkeletalFinSets, source, map, range )
    
    return MapOfFinSets( SkeletalFinSets, source, map, range );
    
end );

##
AddMorphismDatum( SkeletalFinSets,
  function ( SkeletalFinSets, map )
    
    return AsList( map );
    
end );

##
AddIsWellDefinedForObjects( SkeletalFinSets,
   ( cat, n ) -> Length( n ) >= 0 );

##
AddIsEqualForObjects( SkeletalFinSets,
  function ( cat, n1, n2 )
    
    return Length( n1 ) == Length( n2 );
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalFinSets,
  function ( cat, mor )
    local s, rel, t;
    
    s = Length( Source( mor ) );
    
    rel = AsList( mor );
    
    t = Length( Range( mor ) );
    
    ## For CompilerForCAP we need if-elseif-else with the same structure
    if !ForAll( rel, a -> IsInt( a ) && a >= 0 )
        return false;
    elseif s != Length( rel )
        return false;
    elseif !ForAll( rel, a -> a < t )
        return false;
    else
        return true;
    end;
    
end );

##
AddIsEqualForMorphisms( SkeletalFinSets,
  function ( cat, mor1, mor2 )
    
    return AsList( mor1 ) == AsList( mor2 );
    
end );

##
AddIsHomSetInhabited( SkeletalFinSets,
  function ( cat, A, B )
    
    return IsInitial( cat, A ) || !IsInitial( cat, B );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function ( cat, n )
    
    return MapOfFinSets( cat, n, (0):(Length( n ) - 1), n );
    
end );

##
AddPreCompose( SkeletalFinSets,
  function ( cat, map_pre, map_post )
    local s, t, im_pre, im_post, cmp;
    
    s = Source( map_pre );
    t = Range( map_post );
    
    im_pre = AsList( map_pre );
    im_post = AsList( map_post );
    
    cmp = List( s, i -> im_post[1 + im_pre[1 + i]] );
    
    return MapOfFinSets( cat, s, cmp, t );
    
end );

##
AddImageObject( SkeletalFinSets,
  function ( cat, phi )
    
    return FinSet( SkeletalFinSets, Length( Set( AsList( phi ) ) ) );
    
end );

## the function SKELETAL_FIN_SETS_IsEpimorphism
## has linear runtime complexity
AddIsEpimorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs = AsList( phi );
    
    t = Length( Range( phi ) );
    
    ## we do !have a linear purely functional test (yet),
    ## the following linear runtime function works with side effects,
    ## so we hide it from the compiler
    
    return !(false ??? SKELETAL_FIN_SETS_IsEpimorphism( imgs, t ));
    
end );

##
AddIsSplitEpimorphism( SkeletalFinSets,
  ( cat, phi ) -> IsEpimorphism( cat, phi ) );

##
AddIsMonomorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs = AsList( phi );
    
    t = Length( Range( phi ) );
    
    ## we do !have a linear purely functional test (yet),
    ## the following linear runtime function works with side effects,
    ## so we hide it from the compiler
    
    return SKELETAL_FIN_SETS_IsMonomorphism( imgs, t );
    
end );

##
AddIsSplitMonomorphism( SkeletalFinSets,
  function ( cat, phi )
    return IsInitial( cat, Range( phi ) ) || ( !IsInitial( cat, Source( phi ) ) && IsMonomorphism( cat, phi ) );
end );

##
AddIsLiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg, fff;
    
    ff = AsList( f );
    gg = AsList( g );
    
    if 100 * Length( ff ) < Length( gg )
        fff = Set( ff );
    else ## this is for CompilerForCAP
        fff = ff;
    end;
    
    return ForAll( fff, y -> y ??? gg );
    
end );

##
AddLift( SkeletalFinSets,
  function ( cat, f, g )
    local S, T, gg, ff;
    
    S = Source( f );
    T = Source( g );
    
    gg = AsList( g );
    ff = AsList( f );
    
    return MapOfFinSets( cat, S, List( S, x -> -1 + SafePosition( gg, ff[1 + x] ) ), T );
    
end );

## g \circ f^[-1] is again an ordinary function,
## i.e., fibers of f are mapped under g to the same element
AddIsColiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg;
    
    ff = AsList( f );
    gg = AsList( g );
    
    return ForAll( Set( ff ), i -> Length( Set( gg[Positions( ff, i )] ) ) == 1 );
    
end );

##
AddColift( SkeletalFinSets,
  function ( cat, f, g )
    local S, T, ff, gg, chi;
    
    S = Range( f );
    T = Range( g );
    
    ff = AsList( f );
    gg = AsList( g );
    
    chi =
      function ( y )
        if !y ??? ff
            return 0;
        end;
        return gg[SafePosition( ff, y )];
    end;
    
    return MapOfFinSets( cat, S, List( S, y -> chi(y) ), T );
    
end );

##
AddImageEmbeddingWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image )
    
    return MapOfFinSets( cat, image, Set( AsList( phi ) ), Range( phi ) );

end );

##
AddCoastrictionToImageWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image_object )
    local G, images, s, L, l, pi;
    
    G = AsList( phi );
    
    images = Set( G );
    
    s = Source( phi );
    
    L = List( s, i -> -1 + SafePosition( images, G[1 + i] ) );
    
    pi = MapOfFinSets( cat, s, L, image_object );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 3, IsEpimorphism( cat, pi ) );
    
    return pi;
    
end );


## Limits

##
AddIsTerminal( SkeletalFinSets,
  function ( cat, M )
    
    return Length( M ) == 1;
    
end );

##
AddTerminalObject( SkeletalFinSets,
  function ( cat )
    
    return FinSet( SkeletalFinSets, 1 );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function ( cat, m, t )
    
    return MapOfFinSets( cat, m, ListWithIdenticalEntries( Length( m ), 0 ), t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function ( cat, L )
    
    return FinSet( SkeletalFinSets, Product( List( L, Length ) ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, k, P )
    local T, l, a;
    
    T = D[k];
    
    l = Length( T );
    
    a = Product( List( D[(1):(k - 1)], Length ) );
    
    return MapOfFinSets( cat, P, List( P, i -> RemInt( QuoInt( i, a ), l ) ), T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, T, tau, P )
    local l, d, dd, taus;
    
    l = Length( D );
    
    d = List( D, Length );
    
    dd = List( (0):(l - 1), j -> Product( d[(1):(j)] ) );
    
    taus = List( tau, AsList );
    
    # if l == 0, then Sum( (0):(l - 1), j -> ... ) == 0 ??? TerminalObject == P
    return MapOfFinSets( cat, T, List( T, i -> Sum( (0):(l - 1), j -> taus[1 + j][1 + i] * dd[1 + j] ) ), P );
    
end );

##
AddEqualizer( SkeletalFinSets,
  function ( cat, s, D )
    local D2, Eq;
    
    D2 = List( D, AsList );
    
    Eq = Filtered( (0):(Length( s ) - 1), x -> ForAll( (1):(Length( D ) - 1), j -> D2[j][1 + x] == D2[j + 1][1 + x] ) );
    
    return FinSet( SkeletalFinSets, Length( Eq ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, E )
    local D2, Eq;
    
    D2 = List( D, AsList );
    
    Eq = Filtered( (0):(Length( s ) - 1), x -> ForAll( (1):(Length( D ) - 1), j -> D2[j][1 + x] == D2[j + 1][1 + x] ) );
    
    return MapOfFinSets( cat, E, Eq, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, E )
    local D2, Eq, t;
    
    D2 = List( D, AsList );
    
    Eq = Filtered( (0):(Length( s ) - 1), x -> ForAll( (1):(Length( D ) - 1), j -> D2[j][1 + x] == D2[j + 1][1 + x] ) );
    
    t = AsList( tau );
    
    return MapOfFinSets( cat, test_object, List( test_object, x -> -1 + SafePosition( Eq, t[1 + x] ) ), E );
    
end );


## Colimits

##
AddIsInitial( SkeletalFinSets,
  function ( cat, M )
    
    return Length( M ) == 0;
    
end );

##
AddInitialObject( SkeletalFinSets,
  function ( cat )
    
    return FinSet( SkeletalFinSets, 0 );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function ( cat, m, I )
    
    return MapOfFinSets( cat, I, [ ], m );
    
end );

##
AddIsProjective( SkeletalFinSets,
  function ( cat, M )
    
    return true;
    
end );

##
AddEpimorphismFromSomeProjectiveObject( SkeletalFinSets,
  ( cat, m ) -> IdentityMorphism( cat, m ) );

##
AddIsInjective( SkeletalFinSets,
  function ( cat, M )
    
    return !IsInitial( cat, M );
    
end );

##
AddSomeInjectiveObject( SkeletalFinSets,
  function ( cat, M )
    
    if IsInitial( cat, M )
        
        return TerminalObject( cat );
        
    else
        
        return M;
        
    end;
    
end );

##
AddMonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject( SkeletalFinSets,
  function ( cat, M, injective_object )
    
    return MapOfFinSets( cat, M, (0):(Length( M ) - 1), injective_object );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function ( cat, L )
    
    return FinSet( SkeletalFinSets, Sum( List( L, Length ) ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, i, coproduct )
    local O, sum, s;
    
    O = L[(1):(i - 1)];
    
    sum = Sum( List( O, Length ) );
    
    s = L[i];
    
    return MapOfFinSets( cat, s, (sum):(sum + Length( s ) - 1), coproduct );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, test_object, tau, S )
    local concat;
    
    concat = Concatenation( List( tau, AsList ) );
    
    return MapOfFinSets( cat, S, concat, test_object );
    
end );

##
AddCoequalizer( SkeletalFinSets,
  function ( cat, s, D )
  
    return FinSet( SkeletalFinSets, Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, C )
    local Cq, cmp;
    
    Cq = SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D );
    
    cmp = List( s, x -> -1 + SafePosition( Cq, SafeFirst( Cq, c -> x ??? c ) ) );
    
    return MapOfFinSets( cat, s, cmp, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, C )
    local Cq;
    
    Cq = SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D );

    return MapOfFinSets( cat, C, List( Cq, x -> tau( x[1] ) ), Range( tau ) );
    
end );

## The cartesian monoidal structure
#= comment for Julia

##
AddCartesianLeftUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, TM )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianLeftUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, TM )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianRightUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, MT )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianRightUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, MT )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets,
  function ( cat, MN, M, N, NM )
    local m, n;
    
    m = Length( M );
    
    n = Length( N );
    
    return MapOfFinSets( cat, MN, List( MN , i -> RemInt( i, n ) * m + QuoInt( i, n ) ), NM );
    
end );

##
AddExponentialOnObjects( SkeletalFinSets,
  function ( cat, M, N )
    local m, n;
    
    m = Length( M );
    n = Length( N );
    
    return FinSet( SkeletalFinSets, n ^ m );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
  function ( cat, S, alpha, beta, T )
    local M, m, N, n, A, a, B, b;
    
    M = Range( alpha );
    m = Length( M );
    N = Source( beta );
    n = Length( N );
    
    A = Source( alpha );
    a = Length( A );
    B = Range( beta );
    b = Length( B );
    
    return
      MapOfFinSets(
              cat,
              S,
              List( (0):(n ^ m - 1),
                function ( i )
                  local composition, images;
                  
                  composition =
                    PreComposeList(
                            cat,
                            [ alpha,
                              MapOfFinSets(
                                      cat,
                                      M,
                                      List( (0):(m - 1), j -> RemInt( QuoInt( i, n^j ), n ) ),
                                      N ),
                              beta ] );
                  
                  images = AsList( composition );
                  
                  return Sum( List( (0):(a - 1), k -> images[1 + k] * b^k ) );
                  
              end ),
              T );
    
end );

##
AddCartesianEvaluationMorphismWithGivenSource( SkeletalFinSets,
  function ( cat, M, N, HM_NxM )
    local m, n, exp;
    
    m = Length( M );
    n = Length( N );
    
    exp = n ^ m;
    
    return MapOfFinSets( cat, HM_NxM, List( (0):(( n^m * m ) - 1), i -> RemInt( QuoInt( i, n^QuoInt( i, exp ) ), n ) ), N );
    
end );

##
AddCartesianCoevaluationMorphismWithGivenRange( SkeletalFinSets,
  function ( cat, M, N, HN_MxN )
    local m, n, mn;
    
    m = Length( M );
    n = Length( N );
    
    mn = m * n;
    
    #return MapOfFinSets( cat, M, List( (0):(m - 1), i -> Sum( (0):(n - 1), j -> ( i + m * j ) * (m*n)^j ) ), HN_MxN );
    
    return MapOfFinSets( cat, M, List( (0):(m - 1), i -> i * GeometricSum( mn, n ) + m * mn * GeometricSumDiff1( mn, n ) ), HN_MxN );
    
end );

##
AddSubobjectClassifier( SkeletalFinSets,
  function ( cat )
      
      return FinSet( cat, 2 );
      
end );

##
AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( SkeletalFinSets,
  function ( cat, monomorphism, Omega )
    local range, images, chi;
    
    range = Range( monomorphism );
    
    images = AsList( monomorphism );
    
    chi = List( range,
                 function ( x )
                   
                   if x ??? images
                       return 1;
                   end;
                   
                   return 0;
                   
               end );
      
      return MapOfFinSets( cat, range, chi, Omega );
      
end );

##
AddMorphismsOfExternalHom( SkeletalFinSets,
  function ( cat, A, B )
    local hom_A_B, T;
    
    hom_A_B = ExponentialOnObjects( cat, A, B );
    
    T = TerminalObject( cat );
    
    return List( hom_A_B,
                 i -> CartesianLambdaElimination( cat,
                         A,
                         B,
                         MapOfFinSets( cat, T, [ i ], hom_A_B ) ) );
    
end );

##
AddExactCoverWithGlobalElements( SkeletalFinSets,
  function ( cat, A )
    
    return MorphismsOfExternalHom( cat, TerminalObject( cat ), A );
    
end );
# =#

end );

##
InstallMethod( @__MODULE__,  ViewObj,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    Print( "|", Length( s ), "|" );
end );

##
InstallMethod( @__MODULE__,  ViewObj,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap ],
        
  function ( phi )
    local arrow;
    
    if HasIsIsomorphism( phi ) && IsIsomorphism( phi )
        
        arrow = "???";
        
    elseif HasIsMonomorphism( phi ) && IsMonomorphism( phi )
        
        arrow = "???";
        
    elseif HasIsEpimorphism( phi ) && IsEpimorphism( phi )
        
        arrow = "???";
        
    else
        
        arrow = "???";
        
    end;
    
    Print( "|", Length( Source( phi ) ), "| ", arrow, " |", Length( Range( phi ) ), "|" );
    
end );

##
InstallMethod( @__MODULE__,  PrintString,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    local l, string;
    
    l = Length( s );
    
    if l == 0
        return "???";
    elseif l == 1
        return "[ 0 ]";
    elseif l == 2
        return "[ 0, 1 ]";
    elseif l == 3
        return "[ 0, 1, 2 ]";
    end;
    
    return Concatenation( "[ 0,..., ", string( l - 1 ), " ]" );
    
end );

##
InstallMethod( @__MODULE__,  Display,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    Print( PrintString( s ), "\n" );
end );

##
InstallMethod( @__MODULE__,  Display,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap ],
        
  function ( phi )
    Print( PrintString( Source( phi ) ) );
    Print( " ???", AsList( phi ), "??? " );
    Print( PrintString( Range( phi ) ), "\n" );
end );

##
InstallOtherMethod( FinSet,
        "for a nonnegative integer",
        [ IsInt ],
        
  function ( n )
    
    return FinSet( SkeletalFinSets, n );
    
end );
