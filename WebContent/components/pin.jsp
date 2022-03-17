<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <style>.modal-open {
        overflow: hidden
    }
    .modal-open .modal {
        overflow-x: hidden;
        overflow-y: auto
    }
    .modal {
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1050;
        display: none;
        width: 100%;
        height: 100%;
        overflow: hidden;
        outline: 0
    }
    .modal-dialog {
        position: relative;
        width: auto;
        margin: .5rem;
        pointer-events: none
    }
    .modal.fade .modal-dialog {
        transition: -webkit-transform .3s ease-out;
        transition: transform .3s ease-out;
        transition: transform .3s ease-out, -webkit-transform .3s ease-out;
        -webkit-transform: translate(0, -50px);
        transform: translate(0, -50px)
    }
    @media (prefers-reduced-motion:reduce) {
        .modal.fade .modal-dialog {
            transition: none
        }
    }
    .modal.show .modal-dialog {
        -webkit-transform: none;
        transform: none
    }
    .modal.modal-static .modal-dialog {
        -webkit-transform: scale(1.02);
        transform: scale(1.02)
    }
    .modal-dialog-scrollable {
        display: -ms-flexbox;
        display: flex;
        max-height: calc(100% - 1rem)
    }
    .modal-dialog-scrollable .modal-content {
        max-height: calc(100vh - 1rem);
        overflow: hidden
    }
    .modal-dialog-scrollable .modal-footer,
    .modal-dialog-scrollable .modal-header {
        -ms-flex-negative: 0;
        flex-shrink: 0
    }
    .modal-dialog-scrollable .modal-body {
        overflow-y: auto
    }
    .modal-dialog-centered {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        min-height: calc(100% - 1rem)
    }
    .modal-dialog-centered::before {
        display: block;
        height: calc(100vh - 1rem);
        height: -webkit-min-content;
        height: -moz-min-content;
        height: min-content;
        content: ""
    }
    .modal-dialog-centered.modal-dialog-scrollable {
        -ms-flex-direction: column;
        flex-direction: column;
        -ms-flex-pack: center;
        justify-content: center;
        height: 100%
    }
    .modal-dialog-centered.modal-dialog-scrollable .modal-content {
        max-height: none
    }
    .modal-dialog-centered.modal-dialog-scrollable::before {
        content: none
    }
    .modal-content {
        position: relative;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-direction: column;
        flex-direction: column;
        width: 100%;
        pointer-events: auto;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid rgba(0, 0, 0, .2);
        border-radius: .3rem;
        outline: 0
    }
    .modal-backdrop {
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1040;
        width: 100vw;
        height: 100vh;
        background-color: #000
    }
    .modal-backdrop.fade {
        opacity: 0
    }
    .modal-backdrop.show {
        opacity: .5
    }
    .modal-header {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: start;
        align-items: flex-start;
        -ms-flex-pack: justify;
        justify-content: space-between;
        padding: 1rem 1rem;
        border-bottom: 1px solid #dee2e6;
        border-top-left-radius: calc(.3rem - 1px);
        border-top-right-radius: calc(.3rem - 1px)
    }
    .modal-header .close {
        padding: 1rem 1rem;
        margin: -1rem -1rem -1rem auto
    }
    .modal-title {
        margin-bottom: 0;
        line-height: 1.5
    }
    .modal-body {
        position: relative;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        padding: 1rem
    }
    .modal-footer {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        -ms-flex-align: center;
        align-items: center;
        -ms-flex-pack: end;
        justify-content: flex-end;
        padding: .75rem;
        border-top: 1px solid #dee2e6;
        border-bottom-right-radius: calc(.3rem - 1px);
        border-bottom-left-radius: calc(.3rem - 1px)
    }
    .modal-footer>* {
        margin: .25rem
    }
    .modal-scrollbar-measure {
        position: absolute;
        top: -9999px;
        width: 50px;
        height: 50px;
        overflow: scroll
    }
    @media (min-width:576px) {
        .modal-dialog {
            max-width: 500px;
            margin: 1.75rem auto
        }
        .modal-dialog-scrollable {
            max-height: calc(100% - 3.5rem)
        }
        .modal-dialog-scrollable .modal-content {
            max-height: calc(100vh - 3.5rem)
        }
        .modal-dialog-centered {
            min-height: calc(100% - 3.5rem)
        }
        .modal-dialog-centered::before {
            height: calc(100vh - 3.5rem);
            height: -webkit-min-content;
            height: -moz-min-content;
            height: min-content
        }
        .modal-sm {
            max-width: 300px
        }
    }
    @media (min-width:992px) {
        .modal-lg,
        .modal-xl {
            max-width: 800px
        }


        .btn {
    display: inline-block;
    font-weight: 400;
    color: #212529;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: transparent;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out
}
@media (prefers-reduced-motion:reduce) {
    .btn {
        transition: none
    }
}
.btn:hover {
    color: #212529;
    text-decoration: none
}
.btn.focus,
.btn:focus {
    outline: 0;
    box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25)
}
.btn.disabled,
.btn:disabled {
    opacity: .65
}
.btn:not(:disabled):not(.disabled) {
    cursor: pointer
}
a.btn.disabled,
fieldset:disabled a.btn {
    pointer-events: none
}
.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff
}
.btn-primary:hover {
    color: #fff;
    background-color: #0069d9;
    border-color: #0062cc
}
.btn-primary.focus,
.btn-primary:focus {
    color: #fff;
    background-color: #0069d9;
    border-color: #0062cc;
    box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5)
}
.btn-primary.disabled,
.btn-primary:disabled {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff
}
.btn-primary:not(:disabled):not(.disabled).active,
.btn-primary:not(:disabled):not(.disabled):active,
.show>.btn-primary.dropdown-toggle {
    color: #fff;
    background-color: #0062cc;
    border-color: #005cbf
}
.btn-primary:not(:disabled):not(.disabled).active:focus,
.btn-primary:not(:disabled):not(.disabled):active:focus,
.show>.btn-primary.dropdown-toggle:focus {
    box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5)
}
.btn-secondary {
    color: #fff;
    background-color: #6c757d;
    border-color: #6c757d
}
.btn-secondary:hover {
    color: #fff;
    background-color: #5a6268;
    border-color: #545b62
}
.btn-secondary.focus,
.btn-secondary:focus {
    color: #fff;
    background-color: #5a6268;
    border-color: #545b62;
    box-shadow: 0 0 0 .2rem rgba(130, 138, 145, .5)
}
.btn-secondary.disabled,
.btn-secondary:disabled {
    color: #fff;
    background-color: #6c757d;
    border-color: #6c757d
}
.btn-secondary:not(:disabled):not(.disabled).active,
.btn-secondary:not(:disabled):not(.disabled):active,
.show>.btn-secondary.dropdown-toggle {
    color: #fff;
    background-color: #545b62;
    border-color: #4e555b
}
.btn-secondary:not(:disabled):not(.disabled).active:focus,
.btn-secondary:not(:disabled):not(.disabled):active:focus,
.show>.btn-secondary.dropdown-toggle:focus {
    box-shadow: 0 0 0 .2rem rgba(130, 138, 145, .5)
}
.btn-success {
    color: #fff;
    background-color: #28a745;
    border-color: #28a745
}
.btn-success:hover {
    color: #fff;
    background-color: #218838;
    border-color: #1e7e34
}
.btn-success.focus,
.btn-success:focus {
    color: #fff;
    background-color: #218838;
    border-color: #1e7e34;
    box-shadow: 0 0 0 .2rem rgba(72, 180, 97, .5)
}
.btn-success.disabled,
.btn-success:disabled {
    color: #fff;
    background-color: #28a745;
    border-color: #28a745
}
.btn-success:not(:disabled):not(.disabled).active,
.btn-success:not(:disabled):not(.disabled):active,
.show>.btn-success.dropdown-toggle {
    color: #fff;
    background-color: #1e7e34;
    border-color: #1c7430
}
.btn-success:not(:disabled):not(.disabled).active:focus,
.btn-success:not(:disabled):not(.disabled):active:focus,
.show>.btn-success.dropdown-toggle:focus {
    box-shadow: 0 0 0 .2rem rgba(72, 180, 97, .5)
}
    }</style>
</head>
<body>
    <script>
        $(document).ready(function() {
            $("#myModal").modal('show');
        });
    </script>
    <div >
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Enter Pincode</h4>
                        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        Pincode :
                        <input type="text" placeholder="201301" />
                    </div>
                    <!-- Modal footer -->
                    <div class=" modal-footer ">
                        <button type="button " class="btn btn-success " data-dismiss="modal">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>