
# World-Weather

Main app:
    - The app consists of 2 pages - a Search page (1st page) and a details page (2nd page).
    - Each page is built using a VIP pattern, consisting of 
        - Viewcontroller
        - Interactor
        - Presenter
        - workers (API, mapping)
        - Routers
    - The ViewController are storyboard based.
    - Each View has a ViewModel.
    - The API responses are decoded using codables.
    
    Testing:
    Unit tests:
       - Interactors, presenters and workers and routers
       - Common classes such as helpers
       
    UI test:
        - for load indicator and alert system
       
    Use case tests:
        - not included for now 
