   module mygmm
!  GMM_USER_FLAGS
      integer, parameter :: GMM_FLAG_RSTR      =     1    
      integer, parameter :: GMM_FLAG_IZER      =     2    
      integer, parameter :: GMM_FLAG_INAN      =     4    
      integer, parameter :: GMM_FLAG_IINV      =     8    
      integer, parameter :: GMM_FLAG_READ      =    16    
      integer, parameter :: GMM_FLAG_CRTD      =    32    
      integer, parameter :: GMM_FLAG_STAG_X    =    64    
      integer, parameter :: GMM_FLAG_STAG_Y    =   128    
      integer, parameter :: GMM_FLAG_STAG_Z    =   256    
      logical, parameter :: GMM_READ_CKPT=.true.   
      logical, parameter :: GMM_WRIT_CKPT=.false.  
!  GMM VARIABLE SIZES
      integer, parameter :: GMM_MAXNAMELENGTH    =  32   
      integer, parameter :: GMM_META_SIZE =  28
!  GMM_ERROR_CODES
      integer, parameter :: GMM_OK                       = 0     
      integer, parameter :: GMM_ERROR                      = -1   
      integer, parameter :: GMM_KEY_NOT_FOUND            = -2
      integer, parameter :: GMM_VAR_NOT_FOUND            = -3
      integer, parameter :: GMM_INCONSISTENT_DIMS        = -4
      integer, parameter :: GMM_ARRAY_ALREADY_EXISTS     = -5
      integer, parameter :: GMM_VARIABLE_ALREADY_CREATED = -6
      integer, parameter :: GMM_POINTER_TABLE_OVERFLOW   = -7
!  GMM_MESSAGE_LEVELS
      integer, parameter :: GMM_MSG_DEBUG      = -1
      integer, parameter :: GMM_MSG_INFO       =  0
      integer, parameter :: GMM_MSG_WARN       =  1
      integer, parameter :: GMM_MSG_ERROR      =  2
      integer, parameter :: GMM_MSG_SEVERE     =  3
      integer, parameter :: GMM_MSG_FATAL      =  4
      type gmm_layout                              
         SEQUENCE
         integer :: low,high,halo,halomax,n      
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key          
        integer*8 :: uuid1, uuid2 
        integer   :: initmode                   
        integer   :: flags                      
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      type(gmm_layout), parameter                   :: GMM_NULL_LAYOUT=gmm_layout(0,0,0,0,0)
      type(gmm_layout), parameter, dimension(4)     :: GMM_NULL_LAYOUTS = (/GMM_NULL_LAYOUT, GMM_NULL_LAYOUT, GMM_NULL_LAYOUT, GMM_&
     &NULL_LAYOUT/)
      type(gmm_attributes), parameter               :: GMM_NULL_ATTRIB=gmm_attributes(GMM_KEY_NOT_FOUND,0,0,0,0)
      type(gmm_metadata), parameter                 :: GMM_NULL_METADATA=gmm_metadata(GMM_NULL_LAYOUTS , GMM_NULL_ATTRIB)
!!===================== gmm_checkpoint_all =====================
      interface
!
!        if  read_or_write is READ_CKPT (.true.) , read full checkpoint (all types)
!        if  read_or_write is WRIT_CKPT (.false.) , write full checkpoint (all types)
!
      integer function gmm_checkpoint_all(read_or_write)
      logical read_or_write
      end function gmm_checkpoint_all
      end interface
!!===================== gmm_checkpoint =====================
      interface
!
      integer function gmm_checkpoint184(read_or_write)
      logical read_or_write
      end function gmm_checkpoint184
      integer function gmm_checkpoint144(read_or_write)
      logical read_or_write
      end function gmm_checkpoint144
      integer function gmm_checkpoint284(read_or_write)
      logical read_or_write
      end function gmm_checkpoint284
      integer function gmm_checkpoint244(read_or_write)
      logical read_or_write
      end function gmm_checkpoint244
      integer function gmm_checkpoint183(read_or_write)
      logical read_or_write
      end function gmm_checkpoint183
      integer function gmm_checkpoint143(read_or_write)
      logical read_or_write
      end function gmm_checkpoint143
      integer function gmm_checkpoint283(read_or_write)
      logical read_or_write
      end function gmm_checkpoint283
      integer function gmm_checkpoint243(read_or_write)
      logical read_or_write
      end function gmm_checkpoint243
      integer function gmm_checkpoint182(read_or_write)
      logical read_or_write
      end function gmm_checkpoint182
      integer function gmm_checkpoint142(read_or_write)
      logical read_or_write
      end function gmm_checkpoint142
      integer function gmm_checkpoint282(read_or_write)
      logical read_or_write
      end function gmm_checkpoint282
      integer function gmm_checkpoint242(read_or_write)
      logical read_or_write
      end function gmm_checkpoint242
      integer function gmm_checkpoint181(read_or_write)
      logical read_or_write
      end function gmm_checkpoint181
      integer function gmm_checkpoint141(read_or_write)
      logical read_or_write
      end function gmm_checkpoint141
      integer function gmm_checkpoint281(read_or_write)
      logical read_or_write
      end function gmm_checkpoint281
      integer function gmm_checkpoint241(read_or_write)
      logical read_or_write
      end function gmm_checkpoint241
      end interface
!        if  read_or_write is READ_CKPT (.true.) , read one checkpoint group of records
!        if  read_or_write is WRIT_CKPT (.false.) , write all groups of records to checkpoint file
!
!!===================== gmm_create (interface) =====================
!
      interface gmm_create
      integer function gmm_create184(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:,:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create184
      integer function gmm_create144(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:,:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create144
      integer function gmm_create284(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:,:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create284
      integer function gmm_create244(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:,:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create244
      integer function gmm_create183(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create183
      integer function gmm_create143(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create143
      integer function gmm_create283(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create283
      integer function gmm_create243(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:,:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create243
      integer function gmm_create182(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create182
      integer function gmm_create142(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create142
      integer function gmm_create282(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create282
      integer function gmm_create242(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:,:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create242
      integer function gmm_create181(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create181
      integer function gmm_create141(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create141
      integer function gmm_create281(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create281
      integer function gmm_create241(iname,p,field_meta)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:)
      type(gmm_metadata), intent(inout) :: field_meta
      end function gmm_create241
      end interface
!!===================== gmm_create (code) =====================
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
      interface
         function gmm_encodemeta(F_meta,F_code) result(F_istat)
      type gmm_layout                              
         SEQUENCE
         integer :: low,high,halo,halomax,n      
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key          
        integer*8 :: uuid1, uuid2 
        integer   :: initmode                   
        integer   :: flags                      
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
         type(gmm_metadata), intent(in) :: F_meta  
         integer,            intent(out):: F_code(:)
         integer ::  F_istat  
         end function gmm_encodemeta
         function gmm_decodemeta(F_meta,F_code) result(F_istat)
      type gmm_layout                              
         SEQUENCE
         integer :: low,high,halo,halomax,n      
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key          
        integer*8 :: uuid1, uuid2 
        integer   :: initmode                   
        integer   :: flags                      
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
         type(gmm_metadata), intent(out):: F_meta  
         integer,            intent(in) :: F_code(:)
         integer ::  F_istat  
         end function gmm_decodemeta
       end interface
!!===================== gmm_get (interface) =====================
!
      interface gmm_get
      integer function gmm_getmeta2(iname,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      type(gmm_metadata), intent(out) :: m
      end function gmm_getmeta2
      integer function gmm_get184(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:,:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get184
      integer function gmm_get144(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:,:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get144
      integer function gmm_get284(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:,:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get284
      integer function gmm_get244(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:,:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get244
      integer function gmm_get183(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get183
      integer function gmm_get143(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get143
      integer function gmm_get283(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get283
      integer function gmm_get243(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:,:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get243
      integer function gmm_get182(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get182
      integer function gmm_get142(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get142
      integer function gmm_get282(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get282
      integer function gmm_get242(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:,:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get242
      integer function gmm_get181(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*8, pointer :: p(:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get181
      integer function gmm_get141(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      integer*4, pointer :: p(:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get141
      integer function gmm_get281(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*8, pointer :: p(:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get281
      integer function gmm_get241(iname,p,m)
      type gmm_layout
         SEQUENCE
         integer :: low,high,halo,halomax,n
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key
        integer*8 :: uuid1, uuid2
        integer   :: initmode
        integer   :: flags
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      real*4, pointer :: p(:)
      type(gmm_metadata), optional, intent(out) :: m
      end function gmm_get241
      end interface
      interface
      integer function gmm_getmeta(varname, meta)
      type gmm_layout                              
         SEQUENCE
         integer :: low,high,halo,halomax,n      
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key          
        integer*8 :: uuid1, uuid2 
        integer   :: initmode                   
        integer   :: flags                      
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: varname
      type(gmm_metadata), intent(out) :: meta
      end function gmm_getmeta
      end interface
      interface
      integer function gmm_keys(taglist,pattern)
      character(len=*), intent(out) :: taglist(:)
      character(len=*), intent(in), optional :: pattern
      end function gmm_keys
      end interface
!
      interface
      integer function gmm_rename(old_varname, new_varname)
      character(len=*), intent(in) :: old_varname, new_varname
      end function gmm_rename
      end interface
      interface
      integer function gmm_shuffle(taglist)
      character(len=*), intent(out) :: taglist(:)
      end function gmm_shuffle
      end interface
      interface
      function gmm_updatemeta(iname, F_meta) result(F_istat)
      type gmm_layout                              
         SEQUENCE
         integer :: low,high,halo,halomax,n      
      end type
      type gmm_attributes
        SEQUENCE
        integer*8 :: key          
        integer*8 :: uuid1, uuid2 
        integer   :: initmode                   
        integer   :: flags                      
      end type
      type gmm_metadata
        SEQUENCE
        type(gmm_layout), dimension(4) :: l
        type(gmm_attributes) :: a
      end type
      character(len=*), intent(in) :: iname
      type(gmm_metadata), intent(in) :: F_meta  
      integer ::  F_istat  
      end function gmm_updatemeta
      end interface
      interface
      integer function gmm_verbosity(verbose_level)
      integer, intent(in) :: verbose_level
      end function gmm_verbosity
      end interface
   end module mygmm
   module gmm_test_mod
   use mygmm
   implicit none
   integer, parameter :: NI=51, NJ=55, NK=10
   integer, parameter :: TMINUS = 1, TZERO = 2, TPLUS = 3
   type fld2d
      SEQUENCE
      character(len=GMM_MAXNAMELENGTH) :: name
      type (gmm_metadata) :: meta
      real*4,  pointer :: fld(:,:)
   end type fld2d
   type (fld2d), dimension(:) :: pnm(TMINUS:TPLUS), gz(TMINUS:TPLUS), tt(TMINUS:TPLUS)
   type (fld2d), dimension(:) :: uv(TMINUS:TPLUS)
   character(len=GMM_MAXNAMELENGTH) :: cles2D(32), varname
   type(gmm_layout) :: lx = gmm_layout(-1,NI+2,1,2,NI)
   type(gmm_layout) :: ly = gmm_layout(-1,NJ+2,1,2,NJ)
   type(gmm_layout) :: lz = gmm_layout(1,   NK,  0,0,NK)
   type(gmm_layout) :: lxy(2), lyx(2)
   end module gmm_test_mod
!-----------------------------------------------------
   program gmm_test
   use gmm_test_mod
   implicit none
   integer*8 key
   character(len=32) :: taglist(10), shuffle_list(10)
   integer :: ntags = 10
   character(len=4) :: pattern
   integer *8 :: mykey
   integer :: reqid = 0
   integer i,j, ier, nbcles, nkeys
   integer time_step, get_time_step_from_restart
   integer sample_metadata(GMM_META_SIZE)
   type(gmm_metadata) :: lone_meta
   lxy(1)=lx
   lxy(2)=ly
   lyx=(/ ly, lx /)
   cles2D( 1: 3) = (/'PN-', 'PN ', 'PN+' /)
   ier = gmm_verbosity(GMM_MSG_INFO)
   do i=TMINUS,TPLUS
      nullify(pnm(i)%fld)
   enddo
   do i=TMINUS,TPLUS
      pnm(i)%meta = GMM_NULL_METADATA
   enddo
   do i=TMINUS,TPLUS
      pnm(i)%name = cles2D(i)
   enddo
   ier =  gmm_checkpoint_all(GMM_READ_CKPT)
   time_step = get_time_step_from_restart(cles2d(1), cles2D(2), cles2D(3))
   print *, 'time_step_from_restart: ', time_step
   select case (time_step)
      case (0)
         nullify(pnm(TMINUS)%fld)
         pnm(TMINUS)%meta%l(1:2)=lxy
         pnm(TMINUS)%name = cles2D(TMINUS)
         pnm(TMINUS)%meta%a%flags= GMM_FLAG_RSTR
         ier = gmm_create(pnm(TMINUS)%name,pnm(TMINUS)%fld,pnm(TMINUS)%meta)
         if ((ier >= 0)) then
            call initialize(pnm, TMINUS, TPLUS)
         endif
      case (1)
         nullify(pnm(TZERO)%fld)
         pnm(TZERO)%meta%l(1:2)=lxy
         pnm(TZERO)%name = cles2D(TZERO)
         pnm(TZERO)%meta%a%flags= GMM_FLAG_RSTR
         ier = gmm_create(pnm(TZERO)%name,pnm(TZERO)%fld,pnm(TZERO)%meta)
         ier = gmm_get(pnm(TMINUS)%name,pnm(TMINUS)%fld,pnm(TMINUS)%meta)
         call forward_step(pnm, TMINUS, TPLUS)
      case (2)
         nullify(pnm(TPLUS)%fld)
         pnm(TPLUS)%meta%l(1:2)=lxy
         pnm(TPLUS)%name = cles2D(TPLUS)
         pnm(TPLUS)%meta%a%flags= GMM_FLAG_RSTR
         ier = gmm_create(pnm(TPLUS)%name,pnm(TPLUS)%fld,pnm(TPLUS)%meta)
         ier = gmm_get(pnm(TMINUS)%name,pnm(TMINUS)%fld,pnm(TMINUS)%meta)
         ier = gmm_get(pnm(TZERO)%name,pnm(TZERO)%fld,pnm(TZERO)%meta)
         call leap_frog_step(pnm, TMINUS, TPLUS)
      case default
         ier = gmm_get(pnm(TMINUS)%name,pnm(TMINUS)%fld,pnm(TMINUS)%meta)
         ier = gmm_get(pnm(TZERO)%name,pnm(TZERO)%fld,pnm(TZERO)%meta)
         ier = gmm_get(pnm(TPLUS)%name,pnm(TPLUS)%fld,pnm(TPLUS)%meta)
         call leap_frog_step(pnm, TMINUS, TPLUS)
   end select
   taglist = ' '
   taglist(1:3) = cles2D(1:3)
!  Test gmm_get sans pointeur
   pnm(TZERO)%meta = GMM_NULL_METADATA
   ier = gmm_get(pnm(TZERO)%name, pnm(TZERO)%meta)
   print *, 'Test gmm_getmeta : ', pnm(TZERO)%meta%a%key
   do i=TMINUS,TPLUS
      ier = gmm_get(pnm(i)%name,pnm(i)%fld,pnm(i)%meta)
      if ((ier < 0)) then
         print *, 'fld ', pnm(i)%name, 'not found'
!       print *, 'fld', pnm(i)%name, 'not found, creating it...'
!       pnm(i)%meta%l(1:2)=lxy
!       pnm(i)%name = cles2D(i)
!       pnm(i)%meta%a%flags= FLAGS_KEPT_ON_CREATE
!       ier = gmm_create(pnm(i)%name,pnm(i)%fld,pnm(i)%meta)
      else
         print *, '================================================'
         print *,'size of   ', pnm(i)%name, 'is ', size(pnm(i)%fld)
         print *,'shape of  ', pnm(i)%name, 'is ', shape(pnm(i)%fld)
         print *,'lbound of ', pnm(i)%name, 'is ', lbound(pnm(i)%fld)
         print *,'ubound of ', pnm(i)%name, 'is ', ubound(pnm(i)%fld)
         print *,'value of ' , 'pnm(i)%fld(1,1) is',  pnm(i)%fld(1,1)
         print *, '================================================'
         print *
         print *, pnm(i)%name, 'will be written to the checkpoint file'
      endif
   enddo
   print *, 'Testing GMM keys with no pattern'
   nkeys = gmm_keys(taglist)
   print *, 'nkeys = ', nkeys
   print *, '================================='
   do i = 1, nkeys
      print *, (taglist(i))
   enddo
   print *, '================================='
   print *, 'Testing GMM keys with pattern PN+'
   nkeys = gmm_keys(taglist,'PN+')
   print *, 'nkeys = ', nkeys
   print *, '================================='
   do i = 1, nkeys
      print *, (taglist(i))
   enddo
   print *, '================================='
   nullify(gz(TMINUS)%fld)
   gz(TMINUS)%meta%l(1:2)=lxy
   gz(TMINUS)%name = 'GZ-'
   gz(TMINUS)%meta%a%flags= GMM_FLAG_RSTR
   ier = gmm_create(gz(TMINUS)%name,gz(TMINUS)%fld,gz(TMINUS)%meta)
   gz(TZERO)%meta = gz(TMINUS)%meta
   gz(TPLUS)%meta = gz(TMINUS)%meta
   gz(TZERO)%name = 'GZ '
   gz(TPLUS)%name = 'GZ+'
   nullify(gz(TZERO)%fld)
   nullify(gz(TPLUS)%fld)
!   ier = gmm_create(gz(TZERO)%name,gz(TZERO)%fld,gz(TZERO)%meta)
   ier = gmm_create(gz(TPLUS)%name,gz(TPLUS)%fld,gz(TPLUS)%meta)
   gz(TMINUS)%fld = -1.0
   gz(TZERO)%fld  = 0.0
   gz(TPLUS)%fld  =  1.0
   taglist(1) = 'GZ-'
   taglist(2) = 'GZ '
   taglist(3) = 'GZ+'
   do j=1,10
      ier = gmm_shuffle(taglist)
      print *, 'j=',j,'Sorti de GMM_Shuffle'
      do i=TMINUS,TPLUS
         nullify(gz(i)%fld)
         ier = gmm_get(gz(i)%name,gz(i)%fld,gz(i)%meta)
         print '(a4,1x,i16)', gz(i)%name(1:4), gz(i)%meta%a%key
      enddo
      if (gz(TMINUS)%meta%a%key > 0) print *, 'GZ(TMINUS)', gz(TMINUS)%fld(1,1)
      if (gz(TZERO)%meta%a%key > 0) print *, 'GZ(TZERO)',  gz(TZERO)%fld(1,1)
      if (gz(TPLUS)%meta%a%key > 0) print *, 'GZ(TPLUS)',  gz(TPLUS)%fld(1,1)
   enddo
   tt(TZERO)%meta%l(1:2)=lxy
   tt(TZERO)%name = 'TT '
   tt(TZERO)%meta%a%flags= GMM_FLAG_RSTR
   ier = gmm_create(tt(TZERO)%name,tt(TZERO)%fld,tt(TZERO)%meta)
   tt(TZERO)%fld  =  26.0
   tt(TPLUS)%meta = tt(TZERO)%meta
   tt(TPLUS)%name = 'TT+'
   nullify(tt(TPLUS)%fld)
   taglist(1) = 'TT '
   taglist(2) = 'TT+'
   taglist(3) = '   '
   do j=1,10
      ier = gmm_shuffle(taglist)
      print *, 'j=',j,'Sorti de GMM_Shuffle'
      do i=TZERO,TPLUS
         nullify(tt(i)%fld)
         ier = gmm_get(tt(i)%name,tt(i)%fld,tt(i)%meta)
         print '(a4,1x,i16)', tt(i)%name(1:4), tt(i)%meta%a%key
      enddo
      if (tt(TZERO)%meta%a%key > 0) print *, 'TT(TZERO)',  tt(TZERO)%fld(1,1)
      if (tt(TPLUS)%meta%a%key > 0) print *, 'TT(TPLUS)',  tt(TPLUS)%fld(1,1)
   enddo
   taglist(1) = 'UV-'
   taglist(2) = 'UV+'
   ier = gmm_shuffle(taglist)
   print *, 'Test d encodage du metadata'
   ier = gmm_encodemeta(pnm(TZERO)%meta, sample_metadata)
   ier = gmm_decodemeta(lone_meta, sample_metadata)
   print *, 'layout(1)', pnm(TZERO)%meta%l(1), lone_meta%l(1)
   print *, 'key      ', pnm(TZERO)%meta%a%key, lone_meta%a%key
   print *, 'a        ', pnm(TZERO)%meta%a, lone_meta%a
   lone_meta%a%uuid1 = 13
   lone_meta%a%uuid2 = 18
   print *, 'before update uuid1 : ', pnm(TZERO)%meta%a%uuid1
   print *, 'before update uuid2 : ', pnm(TZERO)%meta%a%uuid2
   ier = gmm_updatemeta(pnm(TZERO)%name, lone_meta)
   ier = gmm_getmeta(pnm(TZERO)%name, pnm(TZERO)%meta)
   print *, 'updated uuid1 : ', pnm(TZERO)%meta%a%uuid1
   print *, 'updated uuid2 : ', pnm(TZERO)%meta%a%uuid2
   ier = gmm_checkpoint_all(GMM_WRIT_CKPT)
111 format(a,x,z16,x,i20)
   stop
   end
!-----------------------------------------------------
   integer function get_time_step_from_restart(var_tminus, var_tzero, var_tplus)
   use mygmm
   implicit none
   character(len=GMM_MAXNAMELENGTH) ::  var_tminus, var_tzero, var_tplus
   type (gmm_metadata) :: meta
   real*4,  pointer :: fld(:,:)
   integer ierm, ierz, ierp
   meta = GMM_NULL_METADATA
   nullify(fld)
   ierm = gmm_get(var_tminus, fld, meta)
   meta = GMM_NULL_METADATA
   nullify(fld)
   ierz = gmm_get(var_tzero, fld, meta)
   meta = GMM_NULL_METADATA
   nullify(fld)
   ierp = gmm_get(var_tplus, fld, meta)
   if (ierm < GMM_OK) then
      get_time_step_from_restart = 0
   else if (ierz < GMM_OK) then
      get_time_step_from_restart = 1
   else if (ierp < GMM_OK) then
      get_time_step_from_restart = 2
   else
      get_time_step_from_restart = 3
   endif
   end function get_time_step_from_restart
!-----------------------------------------------------
   subroutine initialize(fld, low, high)
   use gmm_test_mod
   implicit none
   integer ier, i
   integer low,high
   type (fld2d), dimension (:) :: fld(low:high)
   fld(TMINUS)%fld = 0.
   end subroutine initialize
!-----------------------------------------------------
   subroutine forward_step(fld, low, high)
   use gmm_test_mod
   implicit none
   integer low, high
   type (fld2d), dimension (:) :: fld(low:high)
   fld(TZERO)%fld = 1.
   end subroutine forward_step
!-----------------------------------------------------
   subroutine leap_frog_step(fld, low, high)
   use gmm_test_mod
   implicit none
   integer low, high
   type (fld2d), dimension (:) :: fld(low:high)
   fld(TPLUS)%fld =  fld(TZERO)%fld + fld(TMINUS)%fld
   fld(TMINUS)%fld = fld(TZERO)%fld
   fld(TZERO)%fld  = fld(TPLUS)%fld
   end subroutine leap_frog_step
