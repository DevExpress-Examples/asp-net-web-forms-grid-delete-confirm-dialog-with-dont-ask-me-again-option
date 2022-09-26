Imports System.ComponentModel

Public Class DataRow
    Private fId As Integer
    Private fDescription As String

    Public Sub New(ByVal id As Integer, ByVal description As String)
        fId = id
        fDescription = description
    End Sub

    Public Property ID() As Integer
        Get
            Return fId
        End Get
        Set(ByVal value As Integer)
            fId = value
        End Set
    End Property

    Public Property Description() As String
        Get
            Return fDescription
        End Get
        Set(ByVal value As String)
            fDescription = value
        End Set
    End Property
End Class

Public Class GridDataSource
    Private ReadOnly Property Session() As HttpSessionState
        Get
            Return HttpContext.Current.Session
        End Get
    End Property

    Public Function GetRows() As BindingList(Of DataRow)
        If Session("GridDataSource") Is Nothing Then
            CreateRows()
        End If
        Return TryCast(Session("GridDataSource"), BindingList(Of DataRow))
    End Function

    Public Sub CreateRows()
        Dim res As BindingList(Of DataRow) = New BindingList(Of DataRow)()
        For i As Integer = 1 To 25
            Dim item As New DataRow(i, "Sample data for row " & i)
            res.Add(item)
        Next i
        Session("GridDataSource") = res
    End Sub

    Public Sub DeleteRow(ByVal id As Integer)
        Dim rows As BindingList(Of DataRow) = TryCast(Session("GridDataSource"), BindingList(Of DataRow))
        Dim i As Integer = 0
        Do While i < rows.Count
            If rows(i).ID = id Then
                rows.Remove(rows(i))
                Exit Do
            End If
            i += 1
        Loop
    End Sub
End Class