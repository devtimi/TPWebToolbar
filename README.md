# TPWebToolbar

`WebToolbar` subclass that can add a pointer to individual buttons

## Usage

`TPWebToolbar` will silently ignore calls to add or remove pointers prior to the `Shown` event. If you'd like different behavior, change as necessary. `TPWebToolbar` only supports WebToolbarButtons at this time.

#### Add a pointer

To add a pointer to a button, pass the `WebToolbarButton` to `AddPointer` on the `TPWebToolbar` instance. This can be done during the `Shown` event.
```
Sub Shown() Handles Shown
  me.AddPointer(me.Button1)
  
End Sub

```

#### Remove a pointer

To remove a pointer from a button, pass the `WebToolbarButton` to `RemovePointer` on the `TPWebToolbar` instance.
```
TPWebToolbarInstance.RemovePointer(TPWebToolbarInstance.Button2)
```