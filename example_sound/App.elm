port module Main exposing (..)

import Html
import Html.Events


type alias Model =
    {}

type Msg =
    UserClicksButton


port playSound : String -> Cmd msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UserClicksButton ->
            ( model, playSound "explosion.ogg" )


view : Model -> Html.Html Msg
view model =
    Html.button
        [ Html.Events.onClick UserClicksButton ]
        [ Html.text "Kaboom!" ]


main =
    Html.program
        { init = ( {}, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \model -> Sub.none
        }
