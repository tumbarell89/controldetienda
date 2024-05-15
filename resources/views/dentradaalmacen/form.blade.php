<div class="space-y-6">
    
    <div>
        <x-input-label for="factura" :value="__('Factura')"/>
        <x-text-input id="factura" name="factura" type="text" class="mt-1 block w-full" :value="old('factura', $dentradaalmacen?->factura)" autocomplete="factura" placeholder="Factura"/>
        <x-input-error class="mt-2" :messages="$errors->get('factura')"/>
    </div>
    <div>
        <x-input-label for="total" :value="__('Total')"/>
        <x-text-input id="total" name="total" type="text" class="mt-1 block w-full" :value="old('total', $dentradaalmacen?->total)" autocomplete="total" placeholder="Total"/>
        <x-input-error class="mt-2" :messages="$errors->get('total')"/>
    </div>
    <div>
        <x-input-label for="nalmacens_id" :value="__('Nalmacens Id')"/>
        <x-text-input id="nalmacens_id" name="nalmacens_id" type="text" class="mt-1 block w-full" :value="old('nalmacens_id', $dentradaalmacen?->nalmacens_id)" autocomplete="nalmacens_id" placeholder="Nalmacens Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('nalmacens_id')"/>
    </div>
    <div>
        <x-input-label for="dproveedor_origen_id" :value="__('Dproveedor Origen Id')"/>
        <x-text-input id="dproveedor_origen_id" name="dproveedor_origen_id" type="text" class="mt-1 block w-full" :value="old('dproveedor_origen_id', $dentradaalmacen?->dproveedor_origen_id)" autocomplete="dproveedor_origen_id" placeholder="Dproveedor Origen Id"/>
        <x-input-error class="mt-2" :messages="$errors->get('dproveedor_origen_id')"/>
    </div>

    <div class="flex items-center gap-4">
        <x-primary-button>Submit</x-primary-button>
    </div>
</div>