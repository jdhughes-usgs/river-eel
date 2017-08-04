      module GwfMnw2Module
        INTEGER,SAVE,POINTER  ::NMNW2,MNWMAX,NMNWVL,IWL2CB,MNWPRNT
        INTEGER,SAVE,POINTER  ::NODTOT,INTTOT,NTOTNOD
        DOUBLE PRECISION, SAVE,POINTER :: SMALL
        CHARACTER(LEN=20),SAVE, DIMENSION(:),   POINTER     ::WELLID
        CHARACTER(LEN=16),SAVE, DIMENSION(:),   POINTER     ::MNWAUX
        INTEGER, SAVE,    DIMENSION(:,:),     POINTER ::LIMQ
        DOUBLE PRECISION, SAVE, DIMENSION(:,:), POINTER     ::MNW2
        DOUBLE PRECISION, SAVE, DIMENSION(:,:), POINTER     ::MNWNOD
        DOUBLE PRECISION, SAVE, DIMENSION(:,:), POINTER     ::MNWINT
        DOUBLE PRECISION, SAVE, DIMENSION(:,:,:), POINTER     ::CapTable
      TYPE GWFMNWTYPE
        INTEGER,POINTER  ::NMNW2,MNWMAX,NMNWVL,IWL2CB,MNWPRNT
        INTEGER,POINTER  ::NODTOT,INTTOT,NTOTNOD
        DOUBLE PRECISION, POINTER :: SMALL
        CHARACTER(LEN=20), DIMENSION(:),   POINTER     ::WELLID
        CHARACTER(LEN=16), DIMENSION(:),   POINTER     ::MNWAUX
        INTEGER,    DIMENSION(:,:),     POINTER ::LIMQ
        DOUBLE PRECISION,  DIMENSION(:,:), POINTER     ::MNW2
        DOUBLE PRECISION,  DIMENSION(:,:), POINTER     ::MNWNOD
        DOUBLE PRECISION,  DIMENSION(:,:), POINTER     ::MNWINT
        DOUBLE PRECISION,  DIMENSION(:,:,:), POINTER     ::CapTable
      END TYPE
      TYPE(GWFMNWTYPE), SAVE:: GWFMNWDAT(10)
      integer, parameter :: mnwdim = 31
      
      contains
      
C
      SUBROUTINE GWF2MNW27DA(IGRID)
C  Deallocate MNW MEMORY
C
        CALL SGWF2MNW2PNT(IGRID)
        DEALLOCATE(NMNW2)
        DEALLOCATE(MNWMAX)
        DEALLOCATE(NMNWVL)
        DEALLOCATE(IWL2CB)
        DEALLOCATE(MNWPRNT)
        DEALLOCATE(NODTOT)
        DEALLOCATE(INTTOT)
        DEALLOCATE(NTOTNOD)
        DEALLOCATE(SMALL)
        DEALLOCATE(WELLID)
        DEALLOCATE(MNWAUX)
        DEALLOCATE(MNW2)
        DEALLOCATE(MNWNOD)
        DEALLOCATE(MNWINT)
        DEALLOCATE(CapTable)
C
c-lfk
        DEALLOCATE(LIMQ)
      RETURN
      END SUBROUTINE GWF2MNW27DA
      
      SUBROUTINE SGWF2MNW2PNT(IGRID)
C  Change MNW data to a different grid.
C
        NMNW2=>GWFMNWDAT(IGRID)%NMNW2
        MNWMAX=>GWFMNWDAT(IGRID)%MNWMAX
        NMNWVL=>GWFMNWDAT(IGRID)%NMNWVL
        IWL2CB=>GWFMNWDAT(IGRID)%IWL2CB
        MNWPRNT=>GWFMNWDAT(IGRID)%MNWPRNT
        NODTOT=>GWFMNWDAT(IGRID)%NODTOT
        INTTOT=>GWFMNWDAT(IGRID)%INTTOT
        NTOTNOD=>GWFMNWDAT(IGRID)%NTOTNOD
        SMALL=>GWFMNWDAT(IGRID)%SMALL
        WELLID=>GWFMNWDAT(IGRID)%WELLID
        MNWAUX=>GWFMNWDAT(IGRID)%MNWAUX
        MNW2=>GWFMNWDAT(IGRID)%MNW2
        MNWNOD=>GWFMNWDAT(IGRID)%MNWNOD
        MNWINT=>GWFMNWDAT(IGRID)%MNWINT
        CapTable=>GWFMNWDAT(IGRID)%CapTable
C
      RETURN
      END SUBROUTINE SGWF2MNW2PNT
      
      SUBROUTINE SGWF2MNW2PSV(IGRID)
C  Save MNW2 data for a grid.
C
        GWFMNWDAT(IGRID)%NMNW2=>NMNW2
        GWFMNWDAT(IGRID)%MNWMAX=>MNWMAX
        GWFMNWDAT(IGRID)%NMNWVL=>NMNWVL
        GWFMNWDAT(IGRID)%IWL2CB=>IWL2CB
        GWFMNWDAT(IGRID)%MNWPRNT=>MNWPRNT
        GWFMNWDAT(IGRID)%NODTOT=>NODTOT
        GWFMNWDAT(IGRID)%INTTOT=>INTTOT
        GWFMNWDAT(IGRID)%NTOTNOD=>NTOTNOD
        GWFMNWDAT(IGRID)%SMALL=>SMALL
        GWFMNWDAT(IGRID)%WELLID=>WELLID
        GWFMNWDAT(IGRID)%MNWAUX=>MNWAUX
        GWFMNWDAT(IGRID)%MNW2=>MNW2
        GWFMNWDAT(IGRID)%MNWNOD=>MNWNOD
        GWFMNWDAT(IGRID)%MNWINT=>MNWINT
        GWFMNWDAT(IGRID)%CapTable=>CapTable
C
      RETURN
      END SUBROUTINE SGWF2MNW2PSV
        
      end module GwfMnw2Module
