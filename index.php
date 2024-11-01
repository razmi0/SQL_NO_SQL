<!DOCTYPE html>
<html lang="en" data-theme="dark">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css">
    <title>SnoS | Procedures view</title>
</head>

<body class="container-fluid" style="margin-top: 10rem;">
    <style>
        button:not([rel="prev"]) {
            max-width: fit-content;
        }
    </style>
    <script type="module">
        const baseUrl = 'http://localhost/sql_no_sql/api';
        const urlFacture = `${baseUrl}/commande/facture`;
        const urlEmplacement = `${baseUrl}/emplacements/free`;

        const fetchData = async (url, element, payload = null) => {
            let data = null;
            if (payload) {
                url = new URL(url);
                url.search = new URLSearchParams(payload).toString();
            }
            try {
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error('Error fetching data');
                }
                data = JSON.stringify(await response.json(), null, 2);
            } catch (error) {
                data = error.message;

            }
            element.textContent = data;
        }

        const dom = {
            dialogs: {
                close: {
                    facture: document.querySelector('dialog[data-facture] button[rel="prev"]'),
                    emplacement: document.querySelector('dialog[data-emplacement] button[rel="prev"]')
                },
                facture: document.querySelector('dialog[data-facture]'),
                emplacement: document.querySelector('dialog[data-emplacement]')
            },
            buttons: {
                getData: {
                    facture: document.querySelector('button[data-facture]'),
                    emplacement: document.querySelector('button[data-emplacement]')
                },
                reset: {
                    facture: document.querySelector('button[data-reset="facture"]'),
                    emplacement: document.querySelector('button[data-reset="emplacement"]')
                }
            },
            pres: {
                facture: document.querySelector('pre[data-facture]'),
                emplacement: document.querySelector('pre[data-emplacement]')
            },
            inputs: {
                facture: document.querySelector('input#facture'),
                debut: document.querySelector('input#debut'),
                fin: document.querySelector('input#fin')
            }

        }

        const listeners = () => {
            // EMPLACEMENT
            //--
            dom.buttons.getData.emplacement.addEventListener('mousedown', () => {
                const debut = new Date(dom.inputs.debut.value).toLocaleString();
                const fin = new Date(dom.inputs.fin.value).toLocaleString();

                console.log(debut, fin);

                fetchData(urlEmplacement, dom.pres.emplacement, {
                    date_debut: debut,
                    date_fin: fin
                });

                dom.dialogs.emplacement.showModal();
            });

            dom.buttons.reset.emplacement.addEventListener('mousedown', () => {
                dom.pres.emplacement.textContent = '';
            });

            dom.dialogs.close.emplacement.addEventListener('mousedown', () => {
                dom.dialogs.emplacement.close();
            });

            // FACTURE
            //--
            dom.buttons.getData.facture.addEventListener('mousedown', () => {
                const id = dom.inputs.facture.value || 1;
                fetchData(urlFacture, dom.pres.facture, {
                    id
                });
                dom.dialogs.facture.showModal();
            });

            dom.buttons.reset.facture.addEventListener('mousedown', () => {
                dom.pres.facture.textContent = '';
            });

            dom.dialogs.close.facture.addEventListener('mousedown', () => {
                dom.dialogs.facture.close();
            });
        }

        listeners();
    </script>
    <!--  -->
    <!-- FACTURE -->
    <!--  -->
    <hr />
    <header>
        <h4>Facture</h4>
        <small>Afficher les données relative à une commande pour facture :</small>
    </header>
    <fieldset role="group">
        <div>
            <input type="text" id="facture" pattern="[0-9]+" placeholder="Id de la facture...">
        </div>
        <button data-facture>Get data</button>
        <button data-reset="facture" class="secondary">Reset</button>
    </fieldset>
    <hr />
    <!--  -->
    <!-- EMPLACEMENT -->
    <!--  -->
    <header>
        <h4>Emplacements</h4>
        <small>Afficher tous les emplacements libre : </small>
    </header>
    <fieldset role="group">
        <div>
            <label for="debut">Début</label>
            <input type="datetime-local" id="debut">
        </div>
        <div>
            <label for="fin">Fin</label>
            <input type="datetime-local" id="fin">
        </div>
        <button data-emplacement>Get data</button>
        <button data-reset="emplacement" class="secondary">Reset</button>
    </fieldset>
    <hr />
    <!--  -->
    <!-- DATA -->
    <!--  -->
    <dialog data-facture>
        <article>
            <header>
                <button aria-label="Close" rel="prev"></button>
                <p><strong>Facture</strong></p>
            </header>
            <pre data-facture style="overflow-y: scroll; max-height: 40vh;"></pre>
        </article>
    </dialog>
    <dialog data-emplacement>
        <article>
            <header>
                <button aria-label="Close" rel="prev"></button>
                <p><strong>Emplacements</strong></p>
            </header>
            <pre data-emplacement style="overflow-y: scroll; max-height: 40vh;"></pre>
        </article>
    </dialog>
</body>

</html>