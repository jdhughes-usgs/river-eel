      MODULE LGRMODULE
         INTEGER, SAVE, POINTER ::ISCHILD,NGRDS,NPLBEG,NPRBEG,NPCBEG
         INTEGER, SAVE, POINTER ::NPLEND,NPREND,NPCEND,NCPP,NPL,IBOTFLG
         INTEGER, SAVE, POINTER ::ISHFLG,IBFLG,IUPBHSV,IUCBHSV
         INTEGER, SAVE, POINTER ::IUPBFSV,IUCBFSV,MXLGRITER,IOUTLGR 
         INTEGER, SAVE, POINTER ::NBNODES,NPBNODES
         INTEGER, SAVE, POINTER ::IBMAXH,IBMAXF,NCMAXH,NCMAXF
         REAL, SAVE, POINTER ::RELAXH,RELAXF,HCLOSELGR,FCLOSELGR
         REAL, SAVE, POINTER ::HDIFFM,FDIFFM
         REAL, SAVE, POINTER ::PRATIN,CRATIN,PRATOUT,CRATOUT 
         INTEGER, SAVE, POINTER, DIMENSION(:)     ::IBPFLG
         INTEGER, SAVE, POINTER, DIMENSION(:)     ::IEDG
         INTEGER, SAVE, POINTER, DIMENSION(:)     ::JEDG
         INTEGER, SAVE, POINTER, DIMENSION(:)     ::NCPPL
         INTEGER, SAVE, POINTER, DIMENSION(:)     ::NODEH
         INTEGER, SAVE, POINTER, DIMENSION(:)     ::NODEF
         INTEGER, SAVE, POINTER, DIMENSION(:)     ::NCON
         INTEGER, SAVE, POINTER, DIMENSION(:,:)   ::KPLC
         INTEGER, SAVE, POINTER, DIMENSION(:,:)   ::IPLC
         INTEGER, SAVE, POINTER, DIMENSION(:,:)   ::JPLC
         INTEGER, SAVE, POINTER, DIMENSION(:,:)   ::IFACEGN
         INTEGER, SAVE, POINTER, DIMENSION(:,:,:) ::ICBOUND
         REAL, SAVE,    POINTER, DIMENSION(:,:)   ::GNHEAD
         REAL, SAVE,    POINTER, DIMENSION(:,:)   ::DHGN
         REAL, SAVE,    POINTER, DIMENSION(:,:)   ::GNFLUX
         REAL, SAVE,    POINTER, DIMENSION(:,:)   ::GNFLUXR
         REAL, SAVE,    POINTER, DIMENSION(:,:)   ::GNFLUXOLD
         REAL, SAVE,    POINTER, DIMENSION(:,:,:) ::HOLDC
         REAL, SAVE,    POINTER, DIMENSION(:,:)   ::GNCOND
         REAL, SAVE,    POINTER, DIMENSION(:)     ::VCB
         REAL, SAVE,    POINTER, DIMENSION(:,:,:) ::HK
         REAL, SAVE,    POINTER, DIMENSION(:,:,:) ::VK
        TYPE LGRTYPE
         INTEGER, POINTER ::ISCHILD,NGRDS,NPLBEG,NPRBEG,NPCBEG
         INTEGER, POINTER ::NPLEND,NPREND,NPCEND,NCPP,NPL,IBOTFLG
         INTEGER, POINTER ::ISHFLG,IBFLG,IUPBHSV,IUCBHSV
         INTEGER, POINTER ::IUPBFSV,IUCBFSV,MXLGRITER,IOUTLGR
         INTEGER, POINTER ::NBNODES,NPBNODES
         INTEGER, POINTER ::IBMAXH,IBMAXF,NCMAXH,NCMAXF
         REAL, POINTER ::RELAXH,RELAXF,HCLOSELGR,FCLOSELGR,HDIFFM,FDIFFM
         REAL, POINTER ::PRATIN,CRATIN,PRATOUT,CRATOUT 
         INTEGER, POINTER,    DIMENSION(:)     ::IBPFLG
         INTEGER, POINTER,    DIMENSION(:)     ::IEDG
         INTEGER, POINTER,    DIMENSION(:)     ::JEDG
         INTEGER, POINTER,    DIMENSION(:)     ::NCPPL
         INTEGER, POINTER,    DIMENSION(:)     ::NODEH
         INTEGER, POINTER,    DIMENSION(:)     ::NODEF
         INTEGER, POINTER,    DIMENSION(:)     ::NCON
         INTEGER, POINTER,    DIMENSION(:,:)   ::KPLC
         INTEGER, POINTER,    DIMENSION(:,:)   ::IPLC
         INTEGER, POINTER,    DIMENSION(:,:)   ::JPLC
         INTEGER, POINTER,    DIMENSION(:,:)   ::IFACEGN
         INTEGER, POINTER,    DIMENSION(:,:,:) ::ICBOUND
         REAL,    POINTER,    DIMENSION(:,:)   ::GNHEAD
         REAL,    POINTER,    DIMENSION(:,:)   ::DHGN
         REAL,    POINTER,    DIMENSION(:,:)   ::GNFLUX
         REAL,    POINTER,    DIMENSION(:,:)   ::GNFLUXR
         REAL,    POINTER,    DIMENSION(:,:)   ::GNFLUXOLD
         REAL,    POINTER,    DIMENSION(:,:,:) ::HOLDC
         REAL,    POINTER,    DIMENSION(:,:)   ::GNCOND
         REAL,    POINTER,    DIMENSION(:)     ::VCB
         REAL,    POINTER,    DIMENSION(:,:,:) ::HK
         REAL,    POINTER,    DIMENSION(:,:,:) ::VK
        END TYPE
        TYPE(LGRTYPE), SAVE  ::LGRDAT(10)
        
      contains

      SUBROUTINE GWF2LGR2DA(IGRID)
C     ******************************************************************
C     DEALLOCATE LGR DATA
C     ******************************************************************
C
C        SPECIFICATIONS:
C     ------------------------------------------------------------------
      !USE LGRMODULE
C     ------------------------------------------------------------------
C
      DEALLOCATE(LGRDAT(IGRID)%NGRDS)
      DEALLOCATE(LGRDAT(IGRID)%NPLBEG)
      DEALLOCATE(LGRDAT(IGRID)%NPRBEG)
      DEALLOCATE(LGRDAT(IGRID)%NPCBEG)
      DEALLOCATE(LGRDAT(IGRID)%NPLEND)
      DEALLOCATE(LGRDAT(IGRID)%NPREND)
      DEALLOCATE(LGRDAT(IGRID)%NPCEND)
      DEALLOCATE(LGRDAT(IGRID)%NCPP)
      DEALLOCATE(LGRDAT(IGRID)%NPL)
      DEALLOCATE(LGRDAT(IGRID)%IBOTFLG)
      DEALLOCATE(LGRDAT(IGRID)%ISHFLG)
      DEALLOCATE(LGRDAT(IGRID)%IBFLG)
      DEALLOCATE(LGRDAT(IGRID)%IUPBHSV)
      DEALLOCATE(LGRDAT(IGRID)%IUCBHSV)
      DEALLOCATE(LGRDAT(IGRID)%IUPBFSV)
      DEALLOCATE(LGRDAT(IGRID)%IUCBFSV)
      DEALLOCATE(LGRDAT(IGRID)%MXLGRITER)
      DEALLOCATE(LGRDAT(IGRID)%IOUTLGR)
      DEALLOCATE(LGRDAT(IGRID)%RELAXH)
      DEALLOCATE(LGRDAT(IGRID)%RELAXF)
      DEALLOCATE(LGRDAT(IGRID)%HCLOSELGR)
      DEALLOCATE(LGRDAT(IGRID)%FCLOSELGR)
      DEALLOCATE(LGRDAT(IGRID)%HDIFFM)
      DEALLOCATE(LGRDAT(IGRID)%FDIFFM)
      DEALLOCATE(LGRDAT(IGRID)%IBPFLG)
      DEALLOCATE(LGRDAT(IGRID)%HK)
      DEALLOCATE(LGRDAT(IGRID)%VK)
      IF(LGRDAT(IGRID)%ISCHILD .GE. 0)THEN
        DEALLOCATE(LGRDAT(IGRID)%PRATIN)
        DEALLOCATE(LGRDAT(IGRID)%CRATIN)
        DEALLOCATE(LGRDAT(IGRID)%PRATOUT)
        DEALLOCATE(LGRDAT(IGRID)%CRATOUT)
        DEALLOCATE(LGRDAT(IGRID)%NBNODES)
        DEALLOCATE(LGRDAT(IGRID)%NPBNODES)
        DEALLOCATE(LGRDAT(IGRID)%IBMAXH)
        DEALLOCATE(LGRDAT(IGRID)%IBMAXF)
        DEALLOCATE(LGRDAT(IGRID)%NCMAXH)
        DEALLOCATE(LGRDAT(IGRID)%NCMAXF)
        DEALLOCATE(LGRDAT(IGRID)%IEDG)
        DEALLOCATE(LGRDAT(IGRID)%JEDG)
        DEALLOCATE(LGRDAT(IGRID)%NCPPL)
        DEALLOCATE(LGRDAT(IGRID)%NODEH)
        DEALLOCATE(LGRDAT(IGRID)%NODEF)
        DEALLOCATE(LGRDAT(IGRID)%NCON)
        DEALLOCATE(LGRDAT(IGRID)%KPLC)
        DEALLOCATE(LGRDAT(IGRID)%IPLC)
        DEALLOCATE(LGRDAT(IGRID)%JPLC)
        DEALLOCATE(LGRDAT(IGRID)%IFACEGN)
        DEALLOCATE(LGRDAT(IGRID)%ICBOUND)
        DEALLOCATE(LGRDAT(IGRID)%GNHEAD)
        DEALLOCATE(LGRDAT(IGRID)%HOLDC)
        DEALLOCATE(LGRDAT(IGRID)%DHGN)
        DEALLOCATE(LGRDAT(IGRID)%GNFLUX)
        DEALLOCATE(LGRDAT(IGRID)%GNFLUXR)
        DEALLOCATE(LGRDAT(IGRID)%GNFLUXOLD)
        DEALLOCATE(LGRDAT(IGRID)%GNCOND)
        DEALLOCATE(LGRDAT(IGRID)%VCB)
      ENDIF
      DEALLOCATE(LGRDAT(IGRID)%ISCHILD)
C
      RETURN
      END SUBROUTINE GWF2LGR2DA
      
C***********************************************************************

      SUBROUTINE SGWF2LGR2PNT(IGRID)
C     ******************************************************************
C     CHANGE POINTERS FOR LGR DATA TO A DIFFERENT GRID
C     ******************************************************************
C
C        SPECIFICATIONS:
C     ------------------------------------------------------------------
      !USE LGRMODULE
C     ------------------------------------------------------------------
C
      ISCHILD=>LGRDAT(IGRID)%ISCHILD
      NGRDS=>LGRDAT(IGRID)%NGRDS
      NPLBEG=>LGRDAT(IGRID)%NPLBEG
      NPRBEG=>LGRDAT(IGRID)%NPRBEG
      NPCBEG=>LGRDAT(IGRID)%NPCBEG
      NPLEND=>LGRDAT(IGRID)%NPLEND
      NPREND=>LGRDAT(IGRID)%NPREND
      NPCEND=>LGRDAT(IGRID)%NPCEND
      NCPP=>LGRDAT(IGRID)%NCPP
      NPL=>LGRDAT(IGRID)%NPL
      IBOTFLG=>LGRDAT(IGRID)%IBOTFLG
      ISHFLG=>LGRDAT(IGRID)%ISHFLG
      IBFLG=>LGRDAT(IGRID)%IBFLG
      IUPBHSV=>LGRDAT(IGRID)%IUPBHSV
      IUCBHSV=>LGRDAT(IGRID)%IUCBHSV
      IUPBFSV=>LGRDAT(IGRID)%IUPBFSV
      IUCBFSV=>LGRDAT(IGRID)%IUCBFSV
      MXLGRITER=>LGRDAT(IGRID)%MXLGRITER
      IOUTLGR=>LGRDAT(IGRID)%IOUTLGR
      RELAXH=>LGRDAT(IGRID)%RELAXH
      RELAXF=>LGRDAT(IGRID)%RELAXF
      HCLOSELGR=>LGRDAT(IGRID)%HCLOSELGR
      FCLOSELGR=>LGRDAT(IGRID)%FCLOSELGR
      HDIFFM=>LGRDAT(IGRID)%HDIFFM
      FDIFFM=>LGRDAT(IGRID)%FDIFFM
      PRATIN=>LGRDAT(IGRID)%PRATIN
      CRATIN=>LGRDAT(IGRID)%CRATIN
      PRATOUT=>LGRDAT(IGRID)%PRATOUT
      CRATOUT=>LGRDAT(IGRID)%CRATOUT
      IBPFLG=>LGRDAT(IGRID)%IBPFLG
      NBNODES=>LGRDAT(IGRID)%NBNODES
      NPBNODES=>LGRDAT(IGRID)%NPBNODES
      IBMAXH=>LGRDAT(IGRID)%IBMAXH
      IBMAXF=>LGRDAT(IGRID)%IBMAXF
      NCMAXH=>LGRDAT(IGRID)%NCMAXH
      NCMAXF=>LGRDAT(IGRID)%NCMAXF
      IEDG=>LGRDAT(IGRID)%IEDG
      JEDG=>LGRDAT(IGRID)%JEDG
      NCPPL=>LGRDAT(IGRID)%NCPPL
      NODEH=>LGRDAT(IGRID)%NODEH
      NODEF=>LGRDAT(IGRID)%NODEF
      NCON=>LGRDAT(IGRID)%NCON
      KPLC=>LGRDAT(IGRID)%KPLC
      IPLC=>LGRDAT(IGRID)%IPLC
      JPLC=>LGRDAT(IGRID)%JPLC
      IFACEGN=>LGRDAT(IGRID)%IFACEGN
      ICBOUND=>LGRDAT(IGRID)%ICBOUND
      GNHEAD=>LGRDAT(IGRID)%GNHEAD
      HOLDC=>LGRDAT(IGRID)%HOLDC
      DHGN=>LGRDAT(IGRID)%DHGN
      GNFLUX=>LGRDAT(IGRID)%GNFLUX
      GNFLUXR=>LGRDAT(IGRID)%GNFLUXR
      GNFLUXOLD=>LGRDAT(IGRID)%GNFLUXOLD
      GNCOND=>LGRDAT(IGRID)%GNCOND
      VCB=>LGRDAT(IGRID)%VCB
      HK=>LGRDAT(IGRID)%HK
      VK=>LGRDAT(IGRID)%VK
C
      RETURN
      END SUBROUTINE SGWF2LGR2PNT
      
C***********************************************************************

      SUBROUTINE SGWF2LGR2PSV(IGRID)
C     ******************************************************************
C     SAVE POINTERS ARRAYS FOR LGR DATA
C     ******************************************************************
C
C        SPECIFICATIONS:
C     ------------------------------------------------------------------
      !USE LGRMODULE
C     ------------------------------------------------------------------
C
      LGRDAT(IGRID)%ISCHILD=>ISCHILD
      LGRDAT(IGRID)%NGRDS=>NGRDS
      LGRDAT(IGRID)%NPLBEG=>NPLBEG 
      LGRDAT(IGRID)%NPRBEG=>NPRBEG
      LGRDAT(IGRID)%NPCBEG=>NPCBEG
      LGRDAT(IGRID)%NPLEND=>NPLEND
      LGRDAT(IGRID)%NPREND=>NPREND
      LGRDAT(IGRID)%NPCEND=>NPCEND
      LGRDAT(IGRID)%NCPP=>NCPP 
      LGRDAT(IGRID)%NPL=>NPL 
      LGRDAT(IGRID)%IBOTFLG=>IBOTFLG
      LGRDAT(IGRID)%ISHFLG=>ISHFLG
      LGRDAT(IGRID)%IBFLG=>IBFLG
      LGRDAT(IGRID)%IUPBHSV=>IUPBHSV
      LGRDAT(IGRID)%IUCBHSV=>IUCBHSV
      LGRDAT(IGRID)%IUPBFSV=>IUPBFSV
      LGRDAT(IGRID)%IUCBFSV=>IUCBFSV
      LGRDAT(IGRID)%MXLGRITER=>MXLGRITER 
      LGRDAT(IGRID)%IOUTLGR=>IOUTLGR
      LGRDAT(IGRID)%RELAXH=>RELAXH 
      LGRDAT(IGRID)%RELAXF=>RELAXF 
      LGRDAT(IGRID)%HCLOSELGR=>HCLOSELGR 
      LGRDAT(IGRID)%FCLOSELGR=>FCLOSELGR 
      LGRDAT(IGRID)%HDIFFM=>HDIFFM 
      LGRDAT(IGRID)%FDIFFM=>FDIFFM 
      LGRDAT(IGRID)%PRATIN=>PRATIN
      LGRDAT(IGRID)%CRATIN=>CRATIN
      LGRDAT(IGRID)%PRATOUT=>PRATOUT
      LGRDAT(IGRID)%CRATOUT=>CRATOUT
      LGRDAT(IGRID)%IBPFLG=>IBPFLG
      LGRDAT(IGRID)%NBNODES=>NBNODES
      LGRDAT(IGRID)%NPBNODES=>NPBNODES
      LGRDAT(IGRID)%IBMAXH=>IBMAXH
      LGRDAT(IGRID)%IBMAXF=>IBMAXF
      LGRDAT(IGRID)%NCMAXH=>NCMAXH
      LGRDAT(IGRID)%NCMAXF=>NCMAXF
      LGRDAT(IGRID)%IEDG=>IEDG
      LGRDAT(IGRID)%JEDG=>JEDG
      LGRDAT(IGRID)%NCPPL=>NCPPL 
      LGRDAT(IGRID)%NODEH=>NODEH 
      LGRDAT(IGRID)%NODEF=>NODEF
      LGRDAT(IGRID)%NCON=>NCON 
      LGRDAT(IGRID)%KPLC=>KPLC 
      LGRDAT(IGRID)%IPLC=>IPLC 
      LGRDAT(IGRID)%JPLC=>JPLC 
      LGRDAT(IGRID)%IFACEGN=>IFACEGN
      LGRDAT(IGRID)%ICBOUND=>ICBOUND 
      LGRDAT(IGRID)%GNHEAD=>GNHEAD 
      LGRDAT(IGRID)%HOLDC=>HOLDC
      LGRDAT(IGRID)%DHGN=>DHGN
      LGRDAT(IGRID)%GNFLUX=>GNFLUX
      LGRDAT(IGRID)%GNFLUXR=>GNFLUXR
      LGRDAT(IGRID)%GNFLUXOLD=>GNFLUXOLD
      LGRDAT(IGRID)%GNCOND=>GNCOND
      LGRDAT(IGRID)%VCB=>VCB
      LGRDAT(IGRID)%HK=>HK
      LGRDAT(IGRID)%VK=>VK
C
      RETURN
      END SUBROUTINE SGWF2LGR2PSV
      
      END MODULE LGRMODULE
