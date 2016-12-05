import Slides exposing (..)


main = Slides.app

    slidesDefaultOptions

    [ md
        """
        Ports in Elm
        ------------
        """

    , mdFragments
        [ "Everything inside Elm code is pure, separated from the outside world:"
        , "![Elm vs JS](none.png)"
        ]

    , mdFragments
        [   """
            Elm communicates with the world via `Cmd`s
            """
        ,   """
            ![Elm to JS](elmToJs.svg.png)
            """
        ,   """
            A port that communicates from Elm to the World will produce a `Cmd`
            """
        ]

    , mdFragments
        [   """
            ```elm
            port playSound : String -> Cmd msg


            update : Msg -> Model -> ( Model, Cmd Msg )
            update msg model =
                case msg of
                    UserClicksButton ->
                        ( model, playSound "explosion.ogg" )
            ```

            ```javascript
            var elmApp = Elm.Main.fullscreen();
            elmApp.ports.playSound.subscribe(onCmdTriggered);

            function onCmdTriggered(soundName) {
                new Audio(soundName).play();
            }

            ```
            """
        ]

    , mdFragments
        [   """
            The world communicates with Elm via `Msg`s
            """
        ,   """
            ![JS to Elm](jsToElm.svg.png)
            """
        ,   """
            `Msg`s can be triggered by:

            * Html events
            * Subscriptions (`Sub`s)
            * Cmds
            """
        ,   """
            A port that communicates from the World to Elm is a Subscription
            """
        ]

    , mdFragments
        [   """
            ```javascript
            var elmApp = Elm.Main.fullscreen();
            setInterval(onTrigger, 2000)

            function onTrigger() {
                elmApp.ports.ping.send("Ping! - " + new Date());
            }
            ```
            """
        ,   """
            ```elm
            type Msg = PingIsTriggered String

            port ping : (String -> msg) -> Sub msg

            subscriptions : Model -> Sub Msg
            subscriptions model =
                ping PingIsTriggered

            ```
            """
        ,   """
            ```elm
            update : Msg -> Model -> ( Model, Cmd Msg )
            update msg model =
                case msg of
                    PingIsTriggered string ->
                        ( doSomethingWith string, Cmd.none )
            ```
            """
        ]

    , mdFragments
        [   """
            Limits of ports:
            - Only ONE port module (use a `Ports.elm`)
            - Can't pass functions
            - Can't pass union types

            But you can pass `Json.Value`s!
            """
        ]

    , mdFragments
        [   """
            For a practical example check https://github.com/xarvh/elm-haifisch
            or come pester me.

            @xarvh
            """
        ]
    ]

