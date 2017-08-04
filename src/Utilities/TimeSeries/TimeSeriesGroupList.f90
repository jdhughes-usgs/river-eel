module TimeSeriesGroupListModule

  use KindModule, only: DP, I4B
  use ConstantsModule,  only: LINELENGTH
  use ListModule,       only: ListType
  use TimeSeriesModule, only: TimeSeriesGroupType, &
                              ConstructTimeSeriesGroup, &
                              GetTimeSeriesGroupFromList, &
                              AddTimeSeriesGroupToList

  implicit none

  private
  public :: TimeSeriesGroupListType

  type :: TimeSeriesGroupListType
    ! -- Private members
    integer(I4B),   private :: numGroups = 0
    type(ListType), private :: tsGroupList
  contains
    ! -- Public procedures
    procedure, public  :: Add
    procedure, public  :: CountGroups
    procedure, public  :: CountTimeSeries
    procedure, public  :: GetGroup
    procedure, public  :: Clear
    procedure, public  :: da => tsgl_da
    ! -- Private procedures
    procedure, private :: add_time_series_group
  end type TimeSeriesGroupListType

contains

  ! -- Public procedures

  subroutine Add(this, filename, iout, tsGroup)
    implicit none
    ! -- dummy
    class(TimeSeriesGroupListType), intent(inout) :: this
    character(len=*), intent(in) :: filename
    integer(I4B), intent(in) :: iout
    type(TimeSeriesGroupType), pointer, intent(inout) :: tsGroup
    ! -- local
    !
    ! -- Construct and initialize a new time-series group
    call ConstructTimeSeriesGroup(tsGroup)
    call tsGroup%InitializeTsGroup(filename, iout, .true.)

    !
    ! -- Add the time-series group to the list
    call this%add_time_series_group(tsGroup)
    return
  end subroutine Add

  function CountGroups(this)
    implicit none
    ! -- return
    integer(I4B) :: CountGroups
    ! -- dummy
    class(TimeSeriesGroupListType) :: this
    !
    CountGroups = this%tsGroupList%Count()
    !
    return
  end function CountGroups

  function CountTimeSeries(this)
    implicit none
    ! -- return
    integer(I4B) :: CountTimeSeries
    ! -- dummy
    class(TimeSeriesGroupListType) :: this
    ! -- local
    integer(I4B) :: i, numgroups
    type(TimeSeriesGroupType), pointer :: tsgroup
    !
    numgroups = this%CountGroups()
    CountTimeSeries = 0
    do i=1,numgroups
      tsgroup => this%GetGroup(i)
      if (associated(tsgroup)) then
        CountTimeSeries = CountTimeSeries + tsgroup%Count()
      endif
    enddo
    !
    return
  end function CountTimeSeries

  function GetGroup(this, indx) result (res)
    implicit none
    ! -- dummy
    class(TimeSeriesGroupListType) :: this
    integer(I4B), intent(in) :: indx
    ! result
    type(TimeSeriesGroupType), pointer :: res
    ! -- local
    !
    res => GetTimeSeriesGroupFromList(this%tsGroupList, indx)
    return
  end function GetGroup

  ! -- Private procedures

  subroutine add_time_series_group(this, tsGroup)
    implicit none
    ! -- dummy
    class(TimeSeriesGroupListType), intent(inout) :: this
    type(TimeSeriesGroupType), pointer, intent(inout) :: tsGroup
    ! -- local
    !
    call AddTimeSeriesGroupToList(this%tsGroupList, tsGroup)
    this%numGroups = this%numGroups + 1
    return
  end subroutine add_time_series_group

  subroutine Clear(this)
    implicit none
    ! -- dummy
    class(TimeSeriesGroupListType), intent(inout) :: this
    ! -- local
    !
    call this%tsGroupList%Clear()
    return
  end subroutine Clear

  subroutine tsgl_da(this)
    ! -- dummy
    class(TimeSeriesGroupListType), intent(inout) :: this
    ! -- local
    integer(I4B) :: i, n
    type(TimeSeriesGroupType), pointer :: tsg => null()
    !
    n = this%CountGroups()
    do i=1,n
      tsg => this%GetGroup(i)
      call tsg%da()
    enddo
    !
    call this%tsGroupList%Clear(.true.)
    !
    return
  end subroutine tsgl_da

end module TimeSeriesGroupListModule
