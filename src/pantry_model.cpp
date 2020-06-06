#include "pantry_model.h"
#include <QDebug>

PantryModel::PantryModel(QObject* parent) : QAbstractListModel{parent}
{
}

int PantryModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent)
    return _foodItems.size();
}

// to read from the model
QVariant PantryModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return {};

    const auto& item      = _foodItems.at(index.row());
    switch (role)
    {
    case NameRole:
        return item->name();
    case ExpiryDaysRole:
        return item->expiryDays();
    }

    return {};
}

// to edit the model items
bool PantryModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    auto data = _foodItems[index.row()];

    if (role == NameRole)
    {
        if (data->name() == value.toString())
            return false;

        data->setName(value.toString());
        emit dataChanged(index, index);
        return true;
    }
    else if (role == ExpiryDaysRole)
    {
        if (data->expiryDays() == value.toString())
            return false;

        data->setExpiryDays(value.toString());
        emit dataChanged(index, index);
        return true;
    }

    return false;
}

void PantryModel::addFoodItem(const QString& name, const QString& exp)
{
    const auto insertPos = rowCount();
    beginInsertRows(QModelIndex(), insertPos, insertPos);
    const auto item = new FoodItem{name, exp};
    _foodItems.push_back(item);
    endInsertRows();
}

void PantryModel::updateFoodItem(const QModelIndex& index, const QString& name, const QString& exp)
{
    auto data = _foodItems[index.row()];

    if (data->name() != name)
        data->setName(name);
    else if (data->expiryDays() != exp)
        data->setExpiryDays(exp);

    emit dataChanged(index,index);
}

void PantryModel::deleteFoodItem(const int index)
{
    if (_foodItems.isEmpty())
    {
        qDebug() << "delete called when there is no food item";
        return;
    }

    beginRemoveRows({}, index, index);
    _foodItems.takeAt(index);
    endRemoveRows();
    emit layoutChanged();
}

QHash<int, QByteArray> PantryModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[ExpiryDaysRole] = "expiryDays";
    return roles;
}

