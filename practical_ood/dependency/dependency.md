**Recognizing Dependencies:**
- Expecting another class to exist.
- Intending to send a message to someone else than self.
- The arguments that a message requires.
- The order of arguments.

**Writing Loosely Coupled code**
- Purpose: Reduce dependencies by decoupling code.
- Solution:
    - Inject Dependencies (ID): instead of using other class name to create an instance, we inject that instance from outside into constructor method in order to decouple two class.
        ``` 
            def initialize(wheel)
                @wheel = wheel
            end
        ```
    - Isolated Dependencies: 
        - isolate instance creation: 
            - if ID can't be applied, we put the instance of other class in initialization method - just create an instance with "new", we can process it's attributes later.
                ```
                   def initialize
                        @wheel = Wheel.new(rim, tire)
                   end
                ```
            - or we can use ||= operator with method name = instance name, in order to create a instance at the first time use it:
                ```
                   def wheel
                        @wheel ||= Wheel.new(rim, tire)
                   end
                ```
            