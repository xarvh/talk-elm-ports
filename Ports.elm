import Slides exposing (..)


main = Slides.app

    slidesDefaultOptions

    [ md
        """
        Everything inside Elm code is pure, separated from the outside world
        [ image Elm vs the World]
        """
    , mdFragments
        [   """
            The world communicates with Elm via `Msg`
            Msgs can be triggered by Html, subscriptions and Cmds
            [ image: arrow from the world to Elm ]
            """
        ,   """
            A port that communicates from the World to Elm is a subscription
            ---> example of a port subscription
            """
        ]

    , mdFragments
        [   """
            Elm communicates with the world via Cmds
            [ image: arrow from Elm to the World]
            Cmds usually trigger a Msg when they are completed, so we always specify `Cmd msg`
            """
        ,   """
            A port that communicates from Elm to the World will produce a Cmd
            the msg is not relevant, because the port will not trigger anything
            -----> example of a port command
            """
        ]

    , mdFragments
        [   """
            image: Elm vs the World, one arrow for port subscriptions, one arrow for port commands
            """
        ]

    , md
        """
        Example: From Elm to the World: triggering console.log
        """

    , md
        """
        Example: From the World to Elm: using the gamepad
        """

    , md
        """
        Limits of ports:
            - Can't pass functions
            - Can't pass union types
            - Only ONE port module (use a `Ports.elm`)
        """
    ]

