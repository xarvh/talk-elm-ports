port module Main exposing (..)

import Html
import Html.Events


type alias Model =
    List String

type Msg =
    PingIsTriggered String


port ping : (String -> msg) -> Sub msg



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PingIsTriggered string ->
            ( string :: model, Cmd.none )


view : Model -> Html.Html Msg
view model =
    Html.pre [] [ Html.text <| String.join "\n" model ]


main =
    Html.program
        { init = ( [], Cmd.none )
        , update = update
        , view = view
        , subscriptions = \model -> ping PingIsTriggered
        }
